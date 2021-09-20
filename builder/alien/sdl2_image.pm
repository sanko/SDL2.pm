use strict;
use warnings;
use alienfile;
use Config;
#
my $Win32 = $^O eq 'MSWin32';
my $VC    = $Win32                              && ( $Config{ccname} eq 'cl' ? 1 : 0 );
my $x64   = $Config{archname} =~ /^MSWin32-x64/ && $Config{ptrsize} == 8;
#
$Win32 = 0;
#
probe sub {
    my ($build) = @_;    # $build is the Alien::Build instance.
    return 'share';      # We need headers
    system 'pkg-config --exists sdl2';
    $? == 0 ? 'system' : 'share';
};
share {
    start_url 'https://www.libsdl.org/projects/SDL_image/release';

    #SDL2       => 'https://www.libsdl.org/release/SDL2-%s%s',
    #  SDL2_mixer => 'https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-%s%s',
    #  SDL2_ttf   => 'https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-%s%s',
    #  SDL2_image => 'https://www.libsdl.org/projects/SDL_image/release/SDL2_image-%s%s',
    #  SDL2_gfx   => 'https://github.com/a-hurst/sdl2gfx-builds/releases/download/%s/SDL2_gfx-%s%s'
    if ($Win32) {
        if ($VC) {
            plugin 'Download' => (

                # https://www.libsdl.org/projects/SDL_image/release/SDL2_image-devel-2.0.5-VC.zip
                filter  => qr/^SDL2_image-devel-[0-9\.]+-VC\.zip$/,
                version => qr/^SDL2_image-devel-([0-9\.]+)-VC\.zip$/,
            );
            plugin 'Extract' => 'zip';
            build [ 'move lib _lib', 'move _lib/' . ( $x64 ? 'x64' : 'x86' ) . ' lib' ];
        }
        else {
            plugin 'Download' => (

             # https://www.libsdl.org/projects/SDL_image/release/SDL2_image-devel-2.0.5-mingw.tar.gz
                filter  => qr/^SDL2_image-devel-[0-9\.]+-mingw\.tar\.gz$/,
                version => qr/^SDL2_image-devel-([0-9\.]+)-mingw\.tar\.gz$/,
            );
            plugin 'Extract'     => 'tar.gz';
            plugin 'Build::Make' => 'gmake';
            build [
                '%{make} install-package arch=' .
                    ( $x64 ? 'x86_64' : 'i686' ) . '-w64-mingw32 prefix=%{.install.prefix}',
            ];
        }
    }
    else {
        plugin 'Download' => (

            # https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz
            filter  => qr/^SDL2_image-[0-9\.]+\.tar\.gz$/,
            version => qr/^SDL2_image-([0-9\.]+)\.tar\.gz$/,
        );
        plugin 'Extract' => 'tar.gz';
        plugin 'Build::Autoconf';
        plugin 'Build::Make' => 'gmake';
        build [
            '%{configure}',    # --prefix=%{.install.prefix}', # --enable-threads=no',
            '%{make}', '%{make} install',
        ];
    }
};
plugin 'Gather::IsolateDynamic';
gather [
    [ 'pkg-config --modversion SDL2_image', \'%{.runtime.version}' ],
    [   'pkg-config --cflags ' . ( $Win32 ? '--static' : '' ) . ' SDL2_image',
        \'%{.runtime.cflags}'
    ],
    [   ( $Win32 ? 'cd %{.install.prefix}; sh sdl-config --libs' : 'pkg-config --libs SDL2_image' ),
        \'%{.runtime.libs}'
    ],
];
