#include source\custom_structure;
#include source\utilities;
#include scripts\functions;
#include common_scripts\utility;
#include maps\_utility;
#include maps\_hud_util;

print_test( test ) {
    self iprintlnsp( isdefined( test ) ? test : "Empty Test" );
}