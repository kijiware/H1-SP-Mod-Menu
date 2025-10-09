#include source\utilities;
#include source\structure;
#include source\custom_structure;
#include common_scripts\utility;

initial() {
    level initial_precache();

    level thread start_set();
    level thread session_expired();

    level scripts\functions::init();
}

initial_precache() {
    precacheshader( "ui_scrollbar_arrow_right" );
    precacheshader( "ui_scrollbar_arrow_left" );
}

initial_variable() {
    self.menu     = [];
    self.cursor   = [];
    self.slider   = [];
    self.previous = [];
    self.font                = "bigfixed";
    self.font_scale          = 0.3;
    self.option_limit        = 11;
    self.option_spacing      = 16;
    self.x_offset            = -400;
    self.y_offset            = 160;
    self.width               = -20;
    self.interaction_enabled = true;
    self.description_enabled = true;
    self.randomizing_enabled = true;
    self.scrolling_buffer    = 1;
    option = [ ( 0.015, 0.490, 0.996 ), ( 0.631, 0.180, 0.984 ), ( 0.968, 0.200, 0.196 ) ];
    random = option[ randomint( option.size ) ];
    choice = self.randomizing_enabled ? ( random[ 0 ], random[ 1 ], random[ 2 ] ) : option[ 0 ];
    self.color_theme = choice;
    self set_menu();
    self set_title();
}

start_set() {
    self endon( "game_ended" );
    self endon( "disconnect" );
	level waittill_any( "player_spawned", "start_is_set", "spawned_player" );
    level.player thread event_system();
}

event_system() {
    level endon( "game_ended" );
    self endon( "disconnect" );
    for( ;; ) {
        self.spawn_origin = self.origin;
        self.spawn_angles = self.angles;
        if( !isdefined( self.finalized ) ) {
            self.finalized = true;
            self initial_variable();
            self thread initial_observer();
        }
        break;
    }
}

session_expired() {
    level waittill( "game_ended" );
    level endon( "game_ended" );
    foreach( index, player in level.players ) {
        if( player in_menu() )
            player close_menu();
    }
}

initial_observer() {
    level endon( "game_ended" );
    self endon( "disconnect" );
    while( true ) {
        if( !self in_menu() ) {
            if( self adsbuttonpressed() && self meleebuttonpressed() ) {
                if( self.interaction_enabled )
                    self playlocalsound( "h1_ui_menu_warning_box_appear" );
                self open_menu();
                while( self adsbuttonpressed() && self meleebuttonpressed() )
                    wait 0.2;
            }
        }
        else {
            menu   = self get_menu();
            cursor = self get_cursor();
            if( self meleebuttonpressed() ) {
                if( self.interaction_enabled )
                    self playlocalsound( isdefined( self.previous[ ( self.previous.size - 1 ) ] ) ? "h1_ui_pause_menu_resume" : "h1_ui_box_text_disappear" );
                if( isdefined( self.previous[ ( self.previous.size - 1 ) ] ) )
                    self new_menu();
                else
                    self close_menu();
                while( self meleebuttonpressed() )
                    wait 0.2;
            }
            else if( self adsbuttonpressed() && !self attackbuttonpressed() || self attackbuttonpressed() && !self adsbuttonpressed() ) {
                if( isdefined( self.structure ) && self.structure.size >= 2 ) {
                    if( self.interaction_enabled )
                        self playlocalsound( "h1_ui_menu_scroll" );
                    scrolling = self attackbuttonpressed() ? 1 : -1;
                    self set_cursor( ( cursor + scrolling ) );
                    self update_scrolling( scrolling );
                }
                wait ( 0.05 * self.scrolling_buffer );
            }
            else if( self fragbuttonpressed() && !self secondaryoffhandbuttonpressed() || !self fragbuttonpressed() && self secondaryoffhandbuttonpressed() ) {
                if( isdefined( self.structure[ cursor ].array ) || isdefined( self.structure[ cursor ].increment ) ) {
                    if( self.interaction_enabled )
                        self playlocalsound( "h1_ui_menu_scroll" );
                    scrolling = self secondaryoffhandbuttonpressed() ? 1 : -1;
                    self update_slider( scrolling );
                    self update_progression();
                }
                wait ( 0.05 * self.scrolling_buffer );
            }
            else if( self usebuttonpressed() ) {
                if( isdefined( self.structure[ cursor ] ) && isdefined( self.structure[ cursor ].function ) ) {
                    if( self.interaction_enabled )
                        self playlocalsound( isdefined( self.structure[ cursor ].toggle ) ? ( self.structure[ cursor ].toggle ? "mp_ui_accept" : "mp_ui_decline" ) : "h1_ui_menu_scroll" );
                    if( isdefined( self.structure[ cursor ].array ) || isdefined( self.structure[ cursor ].increment ) )
                        self thread execute_function( self.structure[ cursor ].function, isdefined( self.structure[ cursor ].array ) ? self.structure[ cursor ].array[ self.slider[ ( menu + "_" + cursor ) ] ] : self.slider[ ( menu + "_" + cursor ) ], self.structure[ cursor ].parameter_1, self.structure[ cursor ].parameter_2 );
                    else
                        self thread execute_function( self.structure[ cursor ].function, self.structure[ cursor ].parameter_1, self.structure[ cursor ].parameter_2 );
                    if( isdefined( self.structure[ cursor ] ) && isdefined( self.structure[ cursor ].toggle ) )
                        self update_display();
                }
                while( self usebuttonpressed() )
                    wait 0.1;
            }
        }
        wait 0.05;
    }
}