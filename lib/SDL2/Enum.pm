package SDL2::Enum 1.0 {
    use strictures 2;
    use FFI::C;
    use base 'Exporter::Tiny';
    #
    use Data::Dump;
    $|++;
    #
    my %Enums = (

# https://github.com/libsdl-org/SDL/blob/c59d4dcd38c382a1e9b69b053756f1139a861574/include/SDL_hints.h
        SDL_HintPriority => [qw[SDL_HINT_DEFAULT SDL_HINT_NORMAL SDL_HINT_OVERRIDE]]
    );
    my %Defines = (
        SDL_Init => [
            [ SDL_INIT_TIMER          => 0x00000001 ],
            [ SDL_INIT_AUDIO          => 0x00000010 ],
            [ SDL_INIT_VIDEO          => 0x00000020 ],
            [ SDL_INIT_JOYSTICK       => 0x00000200 ],
            [ SDL_INIT_HAPTIC         => 0x00001000 ],
            [ SDL_INIT_GAMECONTROLLER => 0x00002000 ],
            [ SDL_INIT_EVENTS         => 0x00004000 ],
            [ SDL_INIT_SENSOR         => 0x00008000 ],
            [ SDL_INIT_NOPARACHUTE    => 0x00100000 ],
            [   SDL_INIT_EVERYTHING => sub {
                    SDL_INIT_TIMER() | SDL_INIT_AUDIO() | SDL_INIT_VIDEO() | SDL_INIT_EVENTS()
                        | SDL_INIT_JOYSTICK() | SDL_INIT_HAPTIC() | SDL_INIT_GAMECONTROLLER()
                        | SDL_INIT_SENSOR();
                }
            ]
        ],

# https://github.com/libsdl-org/SDL/blob/c59d4dcd38c382a1e9b69b053756f1139a861574/include/SDL_hints.h
        SDL_Hint => [
            qw[SDL_HINT_ACCELEROMETER_AS_JOYSTICK SDL_HINT_ALLOW_TOPMOST
                SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION
                SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION SDL_HINT_ANDROID_BLOCK_ON_PAUSE
                SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO SDL_HINT_ANDROID_SEPARATE_MOUSE_AND_TOUCH
                SDL_HINT_ANDROID_TRAP_BACK_BUTTON SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS
                SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION SDL_HINT_BMP_SAVE_LEGACY_FORMAT
                SDL_HINT_EMSCRIPTEN_ASYNCIFY SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT
                SDL_HINT_ENABLE_STEAM_CONTROLLERS SDL_HINT_FRAMEBUFFER_ACCELERATION
                SDL_HINT_GAMECONTROLLERCONFIG SDL_HINT_GAMECONTROLLERCONFIG_FILE
                SDL_HINT_GAMECONTROLLERTYPE SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES
                SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT SDL_HINT_GAMECONTROLLER_USE_BUTTON_LABELS
                SDL_HINT_GRAB_KEYBOARD SDL_HINT_IDLE_TIMER_DISABLED SDL_HINT_IME_INTERNAL_EDITING
                SDL_HINT_IOS_HIDE_HOME_INDICATOR SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
                SDL_HINT_JOYSTICK_HIDAPI SDL_HINT_JOYSTICK_HIDAPI_CORRELATE_XINPUT
                SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS
                SDL_HINT_JOYSTICK_HIDAPI_PS4 SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE
                SDL_HINT_JOYSTICK_HIDAPI_PS5 SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED
                SDL_HINT_JOYSTICK_HIDAPI_PS5_RUMBLE SDL_HINT_JOYSTICK_HIDAPI_STADIA
                SDL_HINT_JOYSTICK_HIDAPI_STEAM SDL_HINT_JOYSTICK_HIDAPI_SWITCH
                SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED SDL_HINT_JOYSTICK_HIDAPI_XBOX
                SDL_HINT_JOYSTICK_RAWINPUT SDL_HINT_JOYSTICK_THREAD SDL_HINT_LINUX_JOYSTICK_DEADZONES
                SDL_HINT_MAC_BACKGROUND_APP SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK
                SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS SDL_HINT_MOUSE_DOUBLE_CLICK_TIME
                SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH SDL_HINT_MOUSE_NORMAL_SPEED_SCALE
                SDL_HINT_MOUSE_RELATIVE_MODE_WARP SDL_HINT_MOUSE_RELATIVE_SCALING
                SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE SDL_HINT_MOUSE_TOUCH_EVENTS
                SDL_HINT_NO_SIGNAL_HANDLERS SDL_HINT_ORIENTATIONS SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION
                SDL_HINT_QTWAYLAND_WINDOW_FLAGS SDL_HINT_RENDER_DIRECT3D11_DEBUG
                SDL_HINT_RENDER_DIRECT3D_THREADSAFE SDL_HINT_RENDER_DRIVER
                SDL_HINT_RENDER_LOGICAL_SIZE_MODE SDL_HINT_RENDER_OPENGL_SHADERS
                SDL_HINT_RENDER_SCALE_QUALITY SDL_HINT_RENDER_VSYNC SDL_HINT_RPI_VIDEO_LAYER
                SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL SDL_HINT_THREAD_PRIORITY_POLICY
                SDL_HINT_THREAD_STACK_SIZE SDL_HINT_TIMER_RESOLUTION SDL_HINT_TOUCH_MOUSE_EVENTS
                SDL_HINT_TV_REMOTE_AS_JOYSTICK SDL_HINT_VIDEO_ALLOW_SCREENSAVER
                SDL_HINT_VIDEO_EXTERNAL_CONTEXT SDL_HINT_VIDEO_HIGHDPI_DISABLED
                SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS
                SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT SDL_HINT_VIDEO_WIN_D3DCOMPILER
                SDL_HINT_VIDEO_X11_FORCE_EGL SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR
                SDL_HINT_VIDEO_X11_NET_WM_PING SDL_HINT_VIDEO_X11_WINDOW_VISUALID
                SDL_HINT_VIDEO_X11_XINERAMA SDL_HINT_VIDEO_X11_XRANDR SDL_HINT_VIDEO_X11_XVIDMODE
                SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP
                SDL_HINT_WINDOWS_INTRESOURCE_ICON SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL
                SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4 SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN
                SDL_HINT_WINRT_HANDLE_BACK_BUTTON SDL_HINT_WINRT_PRIVACY_POLICY_LABEL
                SDL_HINT_WINRT_PRIVACY_POLICY_URL SDL_HINT_XINPUT_ENABLED
                SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING SDL_HINT__VIDEO_WIN_D3DCOMPILE
                SDL_HINT_RETURN_KEY_HIDES_IME SDL_HINT_WINDOWS_FORCE_MUTEX_CRITICAL_SECTIONS
                SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL SDL_HINT_WINDOWS_USE_D3D9EX
                SDL_HINT_VIDEO_DOUBLE_BUFFER SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER
                SDL_HINT_OPENGL_ES_DRIVER SDL_HINT_AUDIO_RESAMPLING_MODE SDL_HINT_AUDIO_CATEGORY
                SDL_HINT_RENDER_BATCHING SDL_HINT_AUTO_UPDATE_JOYSTICKS SDL_HINT_AUTO_UPDATE_SENSORS
                SDL_HINT_EVENT_LOGGING SDL_HINT_WAVE_RIFF_CHUNK_SIZE SDL_HINT_WAVE_TRUNCATION
                SDL_HINT_WAVE_FACT_CHUNK SDL_HINT_DISPLAY_USABLE_BOUNDS
                SDL_HINT_AUDIO_DEVICE_APP_NAME SDL_HINT_AUDIO_DEVICE_STREAM_NAME
                SDL_HINT_AUDIO_DEVICE_STREAM_ROLE SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
                SDL_HINT_PREFERRED_LOCALES
            ]
        ]
    );

    # Export symbols!
    our %EXPORT_TAGS;
    for my $tag ( keys %Enums ) {
        FFI::C->enum( $tag => $Enums{$tag} );
        $EXPORT_TAGS{$tag} = [ sort map { ref $_ ? $_->[0] : $_ } @{ $Enums{$tag} } ];
    }
    for my $tag ( keys %Defines ) {

        #print $_->[0] . ' ' for sort { $a->[0] cmp $b->[0] } @{ $Defines{$tag} };
        constant->import(
            ref $_ ? ( $_->[0] => ( ref $_->[1] ? $_->[1]->() : $_->[1] ) ) : ( $_ => $_ ) )
            for @{ $Defines{$tag} };

        #constant->import( $_ => $_ ) for @{ $Defines{$tag} };
        $EXPORT_TAGS{$tag} = [ sort map { ref $_ ? $_->[0] : $_ } @{ $Defines{$tag} } ];
    }
    our @EXPORT_OK = map {@$_} values %EXPORT_TAGS;
    $EXPORT_TAGS{default} = [];             # Export nothing by default
    $EXPORT_TAGS{all}     = \@EXPORT_OK;    # Export everything with :all tag

    #ddx \%SDL2::Enum::;
    #warn SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO();
    #warn SDL_INIT_EVERYTHING();
};

=head1 LICENSE

Copyright (C) Sanko Robinson.

This library is free software; you can redistribute it and/or modify it under
the terms found in the Artistic License 2. Other copyrights, terms, and
conditions may apply to data transmitted through this module.

=head1 AUTHOR

Sanko Robinson E<lt>sanko@cpan.orgE<gt>

=for stopwords libSDL

=cut

1;
