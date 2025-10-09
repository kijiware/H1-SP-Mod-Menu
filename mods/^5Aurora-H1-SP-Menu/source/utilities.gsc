is_explosive_damage( smeansofdeath ) {
    if( smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE" )
        return true;

    return false;
}

in_array( array, item ) {
    if( !isdefined( array ) || !isarray( array ) )
        return;

    for( a = 0; a < array.size; a++ ) {
        if( array[ a ] == item )
            return true;
    }

    return false;
}

// element dependencies

    auto_archive() {
        if( !isdefined( self.element_result ) )
            self.element_result = 0;

        if( !isalive( self ) || self.element_result > 22 )
            return true;

        return false;
    }

    create_text( text, font, font_scale, point, relative_point, x_offset, y_offset, color, alpha, sort ) {
        element = self maps\_hud_util::createfontstring( font, font_scale );
        element maps\_hud_util::setpoint( point, relative_point, x_offset, y_offset );

        element.color          = color;
        element.alpha          = alpha;
        element.sort           = sort;
        element.anchor         = self;
        element.hidewheninmenu = true;
        element.archived       = self auto_archive();
        if( isnumber( text ) )
            element setvalue( text );
        else
            element set_text( text );

        self.element_result++;
        return element;
    }

    create_shader( shader, point, relative_point, x_offset, y_offset, width, height, color, alpha, sort ) {
        element                = newclienthudelem( self );
        element.elemtype       = "icon";
        element.children       = [];
        element.color          = color;
        element.alpha          = alpha;
        element.sort           = sort;
        element.anchor         = self;
        element.hidewheninmenu = true;
        element.archived       = self auto_archive();

        element maps\_hud_util::setparent( level.uiparent );
        element maps\_hud_util::setpoint( point, relative_point, x_offset, y_offset );
        element set_shader( shader, width, height );

        self.element_result++;
        return element;
    }

    set_text( text ) {
        if( !isdefined( self ) || !isdefined( text ) )
            return;

        self.text = text;
        self settext( text );
    }

    set_shader( shader, width, height ) {
        if( !isdefined( self ) )
            return;

        if( !isdefined( shader ) ) {
            if( !isdefined( self.shader ) )
                return;

            shader = self.shader;
        }

        if( !isdefined( width ) ) {
            if( !isdefined( self.width ) )
                return;

            width = self.width;
        }

        if( !isdefined( height ) ) {
            if( !isdefined( self.height ) )
                return;

            height = self.height;
        }

        self.shader = shader;
        self.width  = width;
        self.height = height;
        self setshader( shader, width, height );
    }

    // string dependencies

        clean_text( text ) {
            if( !isdefined( text ) || text == "" )
                return;

            if( text[ 0 ] == toupper( text[ 0 ] ) ) {
                if( issubstr( text, " " ) && !issubstr( text, "_" ) )
                    return text;
            }

            text       = strtok( tolower( text ), "_" );
            new_string = "";
            for( a = 0; a < text.size; a++ ) {
                illegal     = [ "player", "weapon", "wpn", "viewmodel", "camo" ];
                replacement = " ";
                if( in_array( illegal, text[ a ] ) ) {
                    for( b = 0; b < text[ a ].size; b++ ) {
                        if( b != 0 )
                            new_string += text[ a ][ b ];
                        else
                            new_string += toupper( text[ a ][ b ] );
                    }

                    if( a != ( text.size - 1 ) )
                        new_string += replacement;
                }
            }

            return new_string;
        }

        clean_name( name ) {
            if( !isdefined( name ) || name == "" )
                return;

            illegal    = [ "^A", "^B", "^F", "^H", "^I", "^0", "^1", "^2", "^3", "^4", "^5", "^6", "^7", "^8", "^9", "^:" ];
            new_string = "";
            for( a = 0; a < name.size; a++ ) {
                if( a < ( name.size - 1 ) ) {
                    if( in_array( illegal, ( name[ a ] + name[ ( a + 1 ) ] ) ) ) {
                        a += 2;
                        if( a >= name.size )
                            break;
                    }
                }

                if( isdefined( name[ a ] ) && a < name.size )
                    new_string += name[ a ];
            }

            return new_string;
        }

    //

    destroy_element() {
        if( !isdefined( self ) )
            return;

        self destroy();
        if( isdefined( self.anchor ) )
            self.anchor.element_result--;
    }

    destroy_all( array ) {
        if( !isdefined( array ) || !isarray( array ) )
            return;

        keys = getarraykeys( array );
        for( a = 0; a < keys.size; a++ ) {
            if( isarray( array[ keys[ a ] ] ) ) {
                foreach( index, value in array[ keys[ a ] ] ) {
                    if( isdefined( value ) )
                        value destroy_element();
                }
            }
            else {
                if( isdefined( array[ keys[ a ] ] ) )
                    array[ keys[ a ] ] destroy_element();
            }
        }
    }

    destroy_option() {
        element = [ "text", "submenu", "toggle", "slider", "category" ];
        for( a = 0; a < element.size; a++ ) {
            if( isdefined( self.menu[ element[ a ] ] ) && self.menu[ element[ a ] ].size )
                destroy_all( self.menu[ element[ a ] ] );

            self.menu[ element[ a ] ]  = [];
        }
    }

//

get_name() {
    name = self.name;
    if( name[ 0 ] != "[" )
        return name;

    for( a = ( name.size - 1 ); a >= 0; a-- ) {
        if( name[ a ] == "]" )
            break;
    }

    return getsubstr( name, ( a + 1 ) );
}

has_access() {
    return isdefined( self.access ) && self.access != "None";
}

calculate_distance( origin, destination, velocity ) {
    return ( distance( origin, destination ) / velocity );
}