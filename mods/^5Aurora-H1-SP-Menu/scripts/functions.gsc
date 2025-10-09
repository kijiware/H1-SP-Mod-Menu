#include source\custom_structure;
#include source\utilities;
#include scripts\testing;
#include common_scripts\utility;
#include maps\_utility;

init() {
    self endon( "game_ended" );
    self endon( "disconnect" );

    precachemodel( "viewmodel_base_viewhands" );
    precachemodel( "defaultactor" );
    precachemodel( "test_sphere_redchrome" );
    precachemodel( "test_sphere_silver" );

    level.weapons_spawning = false;
    level.max_ai_set = false;
    level.ufo_mode_default = false;
    level.god_mode = false;
    level.noclip_mode = false;
    level.slide_toggle = false;
    level.fullbright_normal = false;
    level.fullbright_dev = false;
    level.screenshot_mode = false;
    level.fast_move = false;
    level.high_jump = false;
    level.low_grav = false;
    level.ufo_mode = false;
    level.inf_ammo = false;
    level.laser_toggle = false;
    level.therm_vis = false;
    level.pro_mod = false;
    level.coaster_built = false;
    level.disable_friendly_fire = false;
    level.cluster_nades = false;
    level.slowmo_mode = false;
    level.tire_mode = false;
    level.chaplin_mode = false;
    level.ragdoll_mode = false;
    level.melonhead_mode = false;
    level.tracksuit_mode = false;
    level.lemonade_mode = false;
    level.disable_hud = false;
    level.disable_fx = false;
    level.disable_2d = false;
    level.disable_death_barriers = false;
    level.cqb_walk_allies_toggle = false;
    level.cqb_walk_axis_toggle = false;
    level.toggle_all_perks = false;
    level.toggle_dof = false;
    level.toggle_shiny_mode = false;
    level.toggle_multi_jump = false;
    level.toggle_enemy_kill_aura = false;
    level.toggle_all_kill_aura = false;
    level.toggle_explosive_rounds = false;
    level.toggle_blood_guns = false;
    level.toggle_disco_sun = false;
    level.toggle_drawgun = false;
    level.toggle_notarget = false;
    level.toggle_teleport_gun = false;
    level.toggle_grappling_gun = false;
    level.toggle_jetpack = false;
    level.toggle_unlimited_stock = false;
    level.toggle_unlimited_equipment = false;
    level.toggle_forge_mode = false;
    level.toggle_teleporter = false;
    level.toggle_no_spread = false;
    level.toggle_rapid_fire = false;
    level.toggle_axis_ignore = false;
    level.toggle_allies_ignore = false;
    level.toggle_axis_accuracy = false;
    level.toggle_allies_accuracy = false;
    level.toggle_axis_elites = false;
    level.toggle_allies_elites = false;

    level.weapon_array = [ "ak47", "g3", "g36c", "m14", "m16", "m4", "mp44", "ak74u", "mp5", "p90", "skorpion", "uzi", "m60e4", "rpd", "saw", "m1014", "winchester1200", "barrett", "dragunov", "m21", "m40a3", "remington700", "beretta", "colt45", "deserteagle", "usp", "rpg", "deserteagle55", "fraggrenade", "flashgrenade", "concussiongrenade", "smoke_grenade_american", "smokegrenade", "c4", "claymore", "kam12", "meleeshovel", "meleebottle", "meleeblade", "meleeicepick", "xmlar", "aprast", "febsmg", "aprsmg", "feblmg", "janpst", "aprpst", "meleegladius", "meleesickle", "meleehatchet", "meleefeb1", "meleefeb2", "meleefeb3", "meleefeb4", "meleeapr1", "meleeapr2", "meleeapr3", "meleeapr4", "meleebayonet", "meleepaddle", "febsnp", "meleefeb5", "meleejun1", "meleejun2", "meleejun3", "meleejun4", "meleeaug1", "meleeaug2", "meleeaug3", "meleeaug4", "meleejun5", "augast", "augsmg", "junlmg", "junsho", "junsnp", "augpst", "meleejun6", "flash_grenade", "defaultweapon", "rpg_player", "camera_5fov", "camera_10fov", "camera_20fov", "camera_30fov", "camera_45fov", "m4_grenadier", "m4_grunt", "m4_silencer", "m16_basic", "m16_grenadier", "mp5_muzzle_small", "mp5_silencer", "usp_silencer", "deserteagle_cgoship", "rpg_straight", "ak47_grenadier", "m4m203_silencer_reflex", "m14_scoped_silencer_woodland", "javelin", "javelin_objective", "m14_scoped", "stinger", "ac130_25mm", "ac130_40mm", "ac130_105mm", "remote_missile", "remote_missile_detonator", "crash_missile_airlift", "m4_grunt_muzzle_small", "rpd_muzzle_small", "saw_muzzle_small", "cobra_air_support", "colt45_alasad_killer", "mi28_ffar_village_assault", "m14_scoped_silencer", "p90_silencer", "m14_scoped_woodland", "airstrike_support", "remington700", "uzi_sd", "m4m203_silencer", "ak47_jeeprideending_zakhaevbuddy2", "ak47_muzzle_nodynlight", "beretta_muzzle_nodynlight", "colt45_zak_killer", "m60e4_jeeprideending_zakhaevbuddy1", "m60e4_muzzle_nodynlight", "rpd_muzzle_nodynlight", "rpg_jeepride" ];
    level.perk_array = [ "specialty_null", "specialty_marathon", "specialty_fastreload", "specialty_recoil", "specialty_bulletaccuracy", "specialty_longersprint", "specialty_extratactical", "specialty_extralethal", "specialty_quickdraw", "specialty_detectexplosive", "specialty_flinch", "specialty_fastmantle", "specialty_armorvest", "specialty_armorvest2", "specialty_detectintel", "specialty_overdrive", "specialty_overdrive2", "specialty_overdrive3", "specialty_resistexplosion", "specialty_resistshellshock", "specialty_extended_battery", "specialty_extended_battery2", "specialty_extendeddetectgren", "specialty_exo_blastsuppressor", "specialty_exo_slamboots" ];

    level.slide_target = undefined;
    level.slide_time = 0.80;
    level.map_name = getDvar( "mapname" );

    level._effect[ "blood_hit_knife" ] = loadfx( "vfx/blood/blood_hit_knife" );
    level._effect[ "blood_on_riotshield" ] = loadfx( "vfx/blood/blood_on_riotshield" );
    level._effect[ "blood_smear_decal" ] = loadfx( "vfx/blood/blood_smear_decal" );
    level._effect[ "flashbang_h1" ] = loadfx( "vfx/explosion/flashbang_h1" );
    level._effect[ "frag_grenade_default" ] = loadfx( "vfx/explosion/frag_grenade_default" );
    level._effect[ "rocket_explosion_default" ] = loadfx( "vfx/explosion/rocket_explosion_default" );
    level._effect[ "small_impact_flash_burst" ] = loadfx( "vfx/sparks/small_impact_flash_burst" );
    level._effect[ "laser_debris_fire" ] = loadfx( "vfx/fire/laser_debris_fire" );
    level._effect[ "smoke_grenade_thick_puff_a_end" ] = loadfx( "vfx/smoke/smoke_grenade_thick_puff_a_end" );
    level._effect[ "smoke_grenade_thick_puff_b_end" ] = loadfx( "vfx/smoke/smoke_grenade_thick_puff_b_end" );
    level._effect[ "smoke_grenade_thick_puff_c_end" ] = loadfx( "vfx/smoke/smoke_grenade_thick_puff_c_end" );
    level.smoke_array = [ level._effect[ "smoke_grenade_thick_puff_a_end" ], level._effect[ "smoke_grenade_thick_puff_b_end" ], level._effect[ "smoke_grenade_thick_puff_c_end" ] ];

    thread init_start();
}

init_start() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "start_is_set" );
    if( level.map_name == "coup" ) {
        level.player set_viewhands( "viewmodel_base_viewhands" );
    }
}

iprintlnsp( string, time, fontsize ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    if( !isDefined( time ) ) {
        time = 5;
    }
    if( !isDefined( fontsize ) ) {
        fontsize = 1.1;
    }
	if( !isDefined( self.menu[ "string" ] ) ) {
		self.menu[ "string" ] = self create_text( string, "objective", fontsize, "center", "top", 0, -155, ( 1, 1, 1 ), 1, 9999, false, true );
	} else {
		self.menu[ "string" ] set_text( string );
        self.menu[ "string" ].fontscale = fontsize;
	}
	self.menu[ "string" ].alpha = 1;
    self.menu[ "string" ].glowcolor      = ( 1, 1, 1 );
    self.menu[ "string" ].glowalpha      = 0.2;
	self.menu[ "string" ] setText( string );
    self.menu[ "string" ] setPulseFx( time, time * 155, time * 230 );
}

aim() {
    forwardTrace = self getEye() + ( anglestoforward( self getPlayerAngles() ) * 1000000 );
    traceResult = bulletTrace( self getEye(), forwardTrace, false, self );
    return traceResult;
}

spawn_model( model_name ) {
    precacheModel( model_name );
    spawnAngles = level.player getPlayerAngles();
    model = spawn( "script_model", aim()[ "position" ] + ( 0, 0, 5 ) );
    model.angles = spawnAngles;
    model setModel( model_name );
    model useAnimTree( level.scr_animtree[ self.animname ] );
}

spawn_model_physics( model_name ) {
    precachemodel( model_name );
    spawnAngles = level.player getPlayerAngles();
    model = spawn( "script_model", aim()[ "position" ] + ( 0, 0, 5 ) );
    model.angles = spawnAngles;
    model setModel( model_name );
    model useAnimTree( level.scr_animtree[ self.animname ] );
    model physicsLaunchServer( ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

spawn_scriptmodel( origin, model_name, angles, time, clip )
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    precachemodel( model_name );
    if( isDefined( time ) ) {
        wait time;
    }
    model = spawn( "script_model", origin );
    model setModel( model_name );
    if( isDefined( angles ) ) {
        model.angles = angles;
    }
    if( isDefined( clip ) ) {
        model CloneBrushModelToScriptModel( clip );
    }
    return model;
}

vector_scal( vec, scale ) {
    vec = ( vec[ 0 ] * scale, vec[ 1 ] * scale, vec[ 2 ] * scale );
    return vec;
}

set_viewhands( viewhands ) {
    self setviewmodel( viewhands );
}

strip_suffix( var_0, var_1 )
{
    if ( var_0.size <= var_1.size ) {
        return var_0;
    }
    if ( getsubstr( var_0, var_0.size - var_1.size, var_0.size ) == var_1 ) {
        return getsubstr( var_0, 0, var_0.size - var_1.size );
    }
    return var_0;
}

giveperk( var_0, var_1, var_2 )
{
    _setperk( var_0, var_1, var_2 );
}

_setperk( var_0, var_1, var_2 )
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.perks[var_0] = 1;
    self.perksperkname[var_0] = var_0;
    self.perksuseslot[var_0] = var_1;
    if ( isdefined( level.perksetfuncs[var_0] ) ) {
        self thread [[ level.perksetfuncs[var_0] ]]();
    }
    var_3 = strip_suffix( var_0, "_lefthand" );
    if ( isdefined( var_2 ) ) {
        self setperk( var_0, !isdefined( level.scriptperks[var_3] ), var_1, var_2 );
    }
    else {
        self setperk( var_0, !isdefined( level.scriptperks[var_3] ), var_1 );
    }
}

_unsetperk( var_0 )
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.perks[var_0] = undefined;
    self.perksperkname[var_0] = undefined;
    self.perksuseslot[var_0] = undefined;
    self.perksperkpower[var_0] = undefined;
    if ( isdefined( level.perkunsetfuncs[var_0] ) ) {
        self thread [[ level.perkunsetfuncs[var_0] ]]();
    }
    var_1 = strip_suffix( var_0, "_lefthand" );
    self unsetperk( var_0, !isdefined( level.scriptperks[var_1] ) );
}

_clearperks()
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    foreach ( var_2, var_1 in self.perks ) {
        if ( isdefined( level.perkunsetfuncs[var_2] ) ) {
            self [[ level.perkunsetfuncs[var_2] ]]();
        }
    }

    self.perks = [];
    self.perksperkname = [];
    self.perksuseslot = [];
    self.perksperkpower = [];
    self.perkscustom = [];
    self clearperks();
}

set_vehicles_usable() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    vehicle_array = getentarray( "script_vehicle", "code_classname" );
    foreach( vehicle in vehicle_array ) {
        vehicle.usable = 1;
        vehicle setcursorhint( "HINT_NOICON" );
        vehicle sethintstring( &"SCRIPT_PLATFORM_PIANO" );
        vehicle makeusable();
        wait 0.05;
    }
    self iprintlnsp( "^:Script Vehicles Set To Usable!" );
}

spawn_script_vehicle_drivable( vehicle ) {
    vehicle = maps\_vehicle::spawn_vehicle_from_targetname( vehicle );
    wait 0.1;
    vehicle.usable = 1;
    vehicle setcursorhint( "HINT_NOICON" );
    vehicle sethintstring( &"SCRIPT_PLATFORM_PIANO" );
    vehicle makeusable();
    wait 0.1;
    level.player close_menu();
    level.player setOrigin( vehicle.origin + ( 0, 0, 250 ) );
}

override_random_tire( var_0 )
{
    precachemodel( var_0 );
    level.random_tire_model = var_0;
}

stop_music() {
    music_stop();
    self iprintlnsp( "^:Music Stopped!" );
}

play_music( music ) {
    music_play( music );
    self iprintlnsp( "^:Now Playing: ^1" + music );
}

teleport_spawn() {
    self setorigin( self.spawn_origin );
    self setplayerangles( self.spawn_angles );
}

set_health( health ) {
    self.maxhealth = isdefined( health ) ? health : 100;
    self.health    = self.maxhealth;
}

give_ammo() {
	weapon = self getCurrentWeapon();
	offhand = self getCurrentOffhand();

	self setWeaponAmmoStock( weapon, 999 );
	self setWeaponAmmoStock( offhand, 999 );

	self GiveMaxAmmo( weapon );
	self GiveMaxAmmo( offhand );
}

take_weapon() {
	weapon = self getCurrentWeapon();

	self takeWeapon( weapon );
	self iprintlnsp( "^1" + weapon + " removed" );
}

take_all_weapons() {
    self takeAllWeapons();
}

drop_weapon() {
    weapon = self getCurrentWeapon();
    if( ( weapon != "none" ) ) {
        executeCommand( "dropweapon" );
        wait 0.05;
        self iprintlnsp( "^:Current Weapon Dropped!" );
        wait 0.05;
    }
    else {
        self iprintlnsp( "^1No Weapon Equipped!" );
        wait 0.05;
    }
}

give_weapon( weapon ) {
    self giveWeapon( weapon );
	self switchToWeapon( weapon );
	self iprintlnsp( "^:" + weapon + " added" );
}

spawn_all_weapons() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    if( level.weapons_spawning == false ) {
        level.weapons_spawning = true;
        playerOrigin = level.player.origin + ( 0, 0, 15 );
        foreach( weapon in level.weapon_array ) {
            spawn( "weapon_" + weapon, playerOrigin );
            playerOrigin += ( 20, 0, 0 );
            wait 0.05;
        }
        level.weapons_spawning = false;
        self iprintlnsp( "^:All Weapons Spawned!" );
    }
    else {
        self iprintlnsp( "^3Weapons Still Spawning!" );
    }
}

give_all() {
    executeCommand( "give all" );
    self iprintlnsp( "^:All Weapons Given!" );
}

give_all_weapons() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    foreach( weapon in level.weapon_array ) {
        self giveWeapon( weapon );
    }
    self iprintlnsp( "^:All Weapons Given!" );
}

give_lethal( lethal ) {
    self setlethalweapon( lethal );
    self setweaponammoclip( lethal, 99 );
    self GiveMaxAmmo( lethal );
    self iprintlnsp( "^:Lethal Given: " + lethal );
}

give_equipment( equipment ) {
	self settacticalweapon( equipment );
	self setweaponammoclip( equipment, 99 );
    self GiveMaxAmmo( equipment );
	self iprintlnsp( "^:Equipment Given: " + equipment );
}

set_projectile( projectile ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    if( projectile != "Default" ) {
        self notify( "defaultproj" );
        self endon( "defaultproj" );
        self iprintlnsp( "^:Custom Projectile Set: " + projectile );
        for(;;) {
            self waittill( "weapon_fired" );
            MagicBullet( projectile, level.player.origin + ( 0, 0, 75 ), aim()[ "position" ] );
        }
	}
    else {
        self notify( "defaultproj" );
        self iprintlnsp( "^:Custom Projectile: ^7[^1Off^7]" );
    }
}

pos_print() {
    self iprintlnsp( "^:Position: ^1" + self.origin, 10 );
}

skip_mission() {
    maps\_endmission::_nextmission();
}

change_mission( mission ) {
    changelevel( mission, 0 );
}

restart_mission() {
    executeCommand( "start default; fast_restart" );
}

restart_mission_starts( start ) {
    executeCommand( "start " + start + "; fast_restart" );
}

fail_mission() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    common_scripts\utility::flag_set( "mission_failed" );
    setdvar( "ui_deadquote", "@DEADQUOTE_ALL_WARFARE_IS_BASED" );
    maps\_utility::missionfailedwrapper();
}

move_to_space() {
    self setOrigin( self.origin + ( 0, 0, 240000 ) );
    self setPlayerAngles( 0, 0, -300 );
    self iprintlnsp( "^:Teleported To Space!" );
}

player_control() {
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "actionSlotsHide", 0 );
    setsaveddvar( "hud_showstance", 1 );
    level.player freezecontrols( 0 );
    level.player allowsprint( 1 );
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    level.player allowlean( 1 );
    level.player allowads( 1 );
    level.player allowfire( 1 );
    level.player allowmelee( 1 );
    level.player enableoffhandweapons();
    level.player enableweapons();
    self iprintlnsp( "^:Player Controls Enabled!" );
}

set_timescale( timescale ) {
    executeCommand( "timescale " + timescale );
    self iprintlnsp( "^:Timescale Set: ^1" + timescale );
}

god_mode() {
    self.god_mode = !( isdefined( self.god_mode ) && self.god_mode );

    if( level.god_mode == false ) {
        executeCommand( "god" );
        level.god_mode = true;
        self iprintlnsp( "^:God Mode: ^7[^2On^7]" );
	}
	else {
        executeCommand( "god" );
        level.god_mode = false;
        self iprintlnsp( "^:God Mode: ^7[^1Off^7]" );
	}
}

ufo_mode_default() {
    self.ufo_mode_default = !( isdefined( self.ufo_mode_default ) && self.ufo_mode_default );

    if( level.ufo_mode_default == false ) {
        executeCommand( "ufo" );
        level.ufo_mode_default = true;
        self iprintlnsp( "^:UFO Mode 1: ^7[^2On^7]" );
	}
	else {
        executeCommand( "ufo" );
        level.ufo_mode_default = false;
        self iprintlnsp( "^:UFO Mode 1: ^7[^1Off^7]" );
	}
}

noclip_mode() {
    self.noclip_mode = !( isdefined( self.noclip_mode ) && self.noclip_mode );

    if( level.noclip_mode == false ) {
        executeCommand( "noclip" );
        level.noclip_mode = true;
        self iprintlnsp( "^:No Clip: ^7[^2On^7]" );
	}
	else {
        executeCommand( "noclip" );
        level.noclip_mode = false;
        self iprintlnsp( "^:No Clip: ^7[^1Off^7]" );
	}
}

start_slide() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    level.slide_target = level.player;
    begin_sliding();
    self iprintlnsp( "^:Press [{+actionslot 1}] To Stop Sliding!" );
    notifyoncommand( "cancel_slide", "+actionslot 1" );
    self waittill( "cancel_slide" );
    end_sliding();
}

slide_toggle() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.slide_toggle = !( isdefined( self.slide_toggle ) && self.slide_toggle );

    if( level.slide_toggle == false ) {
        level.slide_target = level.player;
        self thread slide_toggle2();
        self iprintlnsp( "^:Slide Toggle: ^7[^2On^7]" );
        wait 2;
		self iprintlnsp( "^:Press [{+stance}] While Moving To Slide!" );
        level.slide_toggle = true;
	}
	else {
        self notify( "endSlideToggle" );
        level.slide_toggle = false;
        self iprintlnsp( "^:Slide Toggle: ^7[^1Off^7]" );
	}
}

slide_toggle2() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endSlideToggle" );
    for(;;) {
        notifyoncommand( "start_slide", "+stance" );
        self waittill( "start_slide" );
        if( self IsOnGround() && self getvelocity() != ( 0, 0, 0 ) ) {
            self setVelocity( self getvelocity() * 1.65 );
            begin_sliding();
            wait level.slide_time;
            end_sliding();
        }
    }
    wait 1;
}

begin_sliding( var_0, var_1, var_2 )
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    var_3 = level.slide_target;
    var_3 thread play_sound_on_entity( "slide_start_plr_default" );
    if ( soundexists( "slide_loop_plr_default" ) ) {
        var_3 thread play_loop_sound_on_tag( "slide_loop_plr_default" );
    }
    var_4 = isdefined( level.custom_linkto_slide );
    if ( !isdefined( var_0 ) ) {
        var_0 = var_3 getvelocity() + ( 0, 0, -10 );
    }
    if ( !isdefined( var_1 ) ) {
        var_1 = 10;
    }
    if ( !isdefined( var_2 ) ) {
        if ( isdefined( level.slide_dampening ) ) {
            var_2 = level.slide_dampening;
        }
        else {
            var_2 = 0.035;
        }
    }

    var_5 = spawn( "script_origin", var_3.origin );
    var_5.angles = var_3.angles;
    var_3.slidemodel = var_5;
    var_5 moveslide( ( 0, 0, 15 ), 15, var_0 );

    if ( var_4 ) {
        var_3 playerlinktoblend( var_5, undefined, 1 );
    }
    else {
        var_3 playerlinkto( var_5 );
    }

    var_3 allowprone( 0 );
    var_3 allowcrouch( 1 );
    var_3 allowstand( 0 );
    var_3 thread maps\_utility_code::doslide( var_5, var_1, var_2 );
}

end_sliding()
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = self;
    var_0 notify( "stop soundslide_loop_plr_default" );
    var_0 thread play_sound_on_entity( "slide_loop_plr_default" );
    var_0 unlink();
    var_0 setvelocity( var_0.slidemodel.slidevelocity );
    var_0.slidemodel delete();
    var_0 allowprone( 1 );
    var_0 allowcrouch( 1 );
    var_0 allowstand( 1 );
    var_0 notify( "stop_sliding" );
}

fullbright_normal() {
    self.fullbright_normal = !( isdefined( self.fullbright_normal ) && self.fullbright_normal );

	if( level.fullbright_normal == false ) {
        executeCommand( "r_fullbright 1" );
        level.fullbright_normal = true;
        self iprintlnsp( "^:Fullbright: ^7[^2On^7]" );
	}
	else {
        executeCommand( "r_fullbright 0" );
        level.fullbright_normal = false;
        self iprintlnsp( "^:Fullbright: ^7[^1Off^7]" );
	}
}

fullbright_dev() {
    self.fullbright_dev = !( isdefined( self.fullbright_dev ) && self.fullbright_dev );

    if( level.fullbright_dev == false ) {
        executeCommand( "r_disablelightsets 1" );
        executeCommand( "r_fullbright 1" );
        executeCommand( "r_fog 0" );
        executeCommand( "r_tonemapkey 0.18" );
        level.fullbright_dev = true;
        self iprintlnsp( "^:Fullbright Dev: ^7[^2On^7]" );
	}
	else {
        executeCommand( "r_disablelightsets 0" );
        executeCommand( "r_fullbright 0" );
        executeCommand( "r_fog 1" );
        executeCommand( "r_tonemapkey 0" );
        level.fullbright_dev = false;
        self iprintlnsp( "^:Fullbright Dev: ^7[^1Off^7]" );
	}
}

screenshot_mode() {
    self.screenshot_mode = !( isdefined( self.screenshot_mode ) && self.screenshot_mode );

    if( level.screenshot_mode == false ) {
        executeCommand( "cg_draw2d 0" );
        executeCommand( "cg_drawbreathhint 0" );
        executeCommand( "cg_drawcrosshair 0" );
        executeCommand( "cg_drawfps 0" );
        executeCommand( "cg_drawgun 0" );
        executeCommand( "cg_drawhud 0" );
        executeCommand( "cg_drawmantlehint 0" );
        executeCommand( "cg_drawpaused 0" );
        executeCommand( "cg_drawplayerposinfreemove 0" );
        executeCommand( "cg_drawshellshock 0" );
        executeCommand( "cg_drawturretcrosshair 0" );
        level.screenshot_mode = true;
        self iprintlnsp( "^:Screenshot Mode: ^7[^2On^7]" );
        notifyoncommand( "cancel_screenshot", "+actionslot 1" );
        self waittill( "cancel_screenshot" );
        screenshot_mode();
	}
	else {
        executeCommand( "cg_draw2d 1" );
        executeCommand( "cg_drawbreathhint 1" );
        executeCommand( "cg_drawcrosshair 1" );
        executeCommand( "cg_drawfps 1" );
        executeCommand( "cg_drawgun 1" );
        executeCommand( "cg_drawhud 1" );
        executeCommand( "cg_drawmantlehint 1" );
        executeCommand( "cg_drawpaused 1" );
        executeCommand( "cg_drawplayerposinfreemove 1" );
        executeCommand( "cg_drawshellshock 1" );
        executeCommand( "cg_drawturretcrosshair 1" );
        level.screenshot_mode = false;
        self iprintlnsp( "^:Screenshot Mode: ^7[^1Off^7]" );
	}
}

disable_hud() {
    self.disable_hud = !( isdefined( self.disable_hud ) && self.disable_hud );

    if( level.disable_hud == false ) {
        executeCommand( "cg_drawHUD 0" );
        level.disable_hud = true;
        self iprintlnsp( "^:HUD: ^7[^2Off^7]" );
	}
	else {
        executeCommand( "cg_drawHUD 1" );
        level.disable_hud = false;
        self iprintlnsp( "^:HUD: ^7[^1On^7]" );
	}
}

disable_fx() {
    self.disable_fx = !( isdefined( self.disable_fx ) && self.disable_fx );

    if( level.disable_fx == false ) {
        executeCommand( "fx_enable 0" );
        level.disable_fx = true;
        self iprintlnsp( "^:Disable FX: ^7[^2On^7]" );
	}
	else {
        executeCommand( "fx_enable 1" );
        level.disable_fx = false;
        self iprintlnsp( "^:Disable FX: ^7[^1Off^7]" );
	}
}

disable_2d() {
    self.disable_2d = !( isdefined( self.disable_2d ) && self.disable_2d );

    if( level.disable_2d == false ) {
        executeCommand( "cg_draw2d 0" );
        level.disable_2d = true;
        self iprintlnsp( "^:Disable 2d: ^7[^2On^7]" );
	}
	else {
        executeCommand( "cg_draw2d 1" );
        level.disable_2d = false;
        self iprintlnsp( "^:Disable 2d: ^7[^1Off^7]" );
	}
}

disable_death_barriers() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.disable_death_barriers = !( isdefined( self.disable_death_barriers ) && self.disable_death_barriers );

	if( level.disable_death_barriers == false ) {
        ents = getEntArray();
		for( index = 0; index < ents.size; index++ ) {
			if( isSubStr( ents[ index ].classname, "trigger_hurt" ) || isSubStr( ents[ index ].classname, "kill_all_players" ) ) {
                ents[ index ].originalOrigin = ents[ index ].origin;
                ents[ index ].origin = ( 0, 0, 9999999 );
            }
		}
		level.disable_death_barriers = true;
		self iprintlnsp( "^:Death Barriers: ^7[^2Removed^7]" );
    }
	else {
		ents = getEntArray();
		for( index = 0; index < ents.size; index++ ) {
			if( isSubStr( ents[ index ].classname, "trigger_hurt" ) || isSubStr( ents[ index ].classname, "kill_all_players" ) ) {
				if( isDefined( ents[ index ].originalOrigin ) ) {
					ents[ index ].origin = ents[ index ].originalOrigin;
				}
				else {
					self iprintlnsp( "Original position not found for entity " + index + ", cannot reset." );
				}
			}
		}
		level.disable_death_barriers = false;
		self iprintlnsp( "^:Death Barriers: ^7[^1Reset^7]" );
	}
}

fast_move() {
    self.fast_move = !( isdefined( self.fast_move ) && self.fast_move );

	if( level.fast_move == false ) {
        executeCommand( "g_speed 470" );
        level.fast_move = true;
        self iprintlnsp( "^:Faster Move Speed: ^7[^2On^7]" );
	}
	else {
        executeCommand( "g_speed 190" );
        level.fast_move = false;
        self iprintlnsp( "^:Faster Move Speed: ^7[^1Off^7]" );
	}
}

high_jump() {
    self.high_jump = !( isdefined( self.high_jump ) && self.high_jump );

	if( level.high_jump == false ) {
        executeCommand( "jump_height 1000" );
        level.high_jump = true;
        self iprintlnsp( "^:Higher Jumps: ^7[^2On^7]" );
	}
	else {
        executeCommand( "jump_height 41" );
        level.high_jump = false;
        self iprintlnsp( "^:Higher Jumps: ^7[^1Off^7]" );
	}
}

low_grav() {
    self.low_grav = !( isdefined( self.low_grav ) && self.low_grav );

	if( level.low_grav == false ) {
        executeCommand( "g_gravity 120" );
        level.low_grav = true;
        self iprintlnsp( "^:Low Gravity: ^7[^2On^7]" );
	}
	else {
        executeCommand( "g_gravity 800" );
        level.low_grav = false;
        self iprintlnsp( "^:Low Gravity: ^7[^1Off^7]" );
	}
}

ufo_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.ufo_mode = !( isdefined( self.ufo_mode ) && self.ufo_mode );

	if( level.ufo_mode == false ) {
		self thread ufo_mode2();
        level.ufo_mode = true;
        self iprintlnsp( "^:UFO Mode 2: ^7[^2On^7]" );
        wait 2;
		self iprintlnsp( "^:Hold [{+smoke}] to fly | Press [{+speed_throw}] to land" );
	}
	else {
		self notify( "endUFOMode" );
        level.ufo_mode = false;
        self iprintlnsp( "^:UFO Mode 2: ^7[^1Off^7]" );
	}
}

ufo_mode2() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endUFOMode" );
    self.Fly = 0;
    UFO = spawn( "script_model", self.origin );
    for(;;) {
        if( self secondaryoffhandbuttonpressed()) {
            self playerLinkTo( UFO );
            self.Fly = 1;
        }
        else {
            self.Fly = 0;
        }
        if( self AdsButtonPressed() && self.Fly == 0 ) {
            self unlink();
            self.Fly = 0;
            self.UFO delete();
        }
        if( self.Fly == 1 ) {
            Fly = self.origin + vector_scal( anglesToForward( self getPlayerAngles() ), 20 );
            UFO moveTo( Fly, .03 );
        }
        wait 0.05;
    }
}



inf_ammo() {
    self.inf_ammo = !( isdefined( self.inf_ammo ) && self.inf_ammo );

    if( level.toggle_rapid_fire == true ) {
        toggle_rapid_fire();
    }

	if( level.inf_ammo == false ) {
        setsaveddvar( "player_sustainAmmo", 1 );
        level.inf_ammo = true;
        self iprintlnsp( "^:Infinite Ammo: ^7[^2On^7]" );
	}
	else {
        setsaveddvar( "player_sustainAmmo", 0 );
        level.inf_ammo = false;
        self iprintlnsp( "^:Infinite Ammo: ^7[^1Off^7]" );
	}
}

laser_toggle() {
    self.laser_toggle = !( isdefined( self.laser_toggle ) && self.laser_toggle );

	if( level.laser_toggle == false ) {
        self laseron();
        level.laser_toggle = true;
        self iprintlnsp( "^:Laser: ^7[^2On^7]" );
	}
	else {
        self laseroff();
        level.laser_toggle = false;
        self iprintlnsp( "^:Laser: ^7[^1Off^7]" );
	}
}

therm_vis() {
    self.therm_vis = !( isdefined( self.therm_vis ) && self.therm_vis );

	if( level.therm_vis == false ) {
        maps\_load::thermal_effectson();
        self thermalvisionon();
        level.therm_vis = true;
        self iprintlnsp( "^:Thermal Vision: ^7[^2On^7]" );
	}
	else {
        maps\_load::thermal_effectsoff();
        self thermalvisionoff();
        level.therm_vis = false;
        self iprintlnsp( "^:Thermal Vision: ^7[^1Off^7]" );
	}
}

pro_mod( fog ) {
    self.pro_mod = !( isdefined( self.pro_mod ) && self.pro_mod );

	if( level.pro_mod == false ) {
        self VisionSetNakedForPlayer( "default", 2 ); 
        executeCommand( "player_breath_snd_delay 0" );
        executeCommand( "perk_extraBreath 0" );
        executeCommand( "cg_brass 0" );
        executeCommand( "r_blur 0.13" );
        executeCommand( "r_specularcolorscale 10" );
        executeCommand( "r_filmusetweaks 1" );
        executeCommand( "r_filmtweakenable 1" );
        executeCommand( "r_filmtweakcontrast 1.53" );
        executeCommand( "r_brightness 0.2" );
        executeCommand( "fx_drawclouds 0" );
        executeCommand( "cg_blood 0" );
        executeCommand( "r_dlightLimit 0" );
        executeCommand( "r_fog 0" );
        level.pro_mod = true;
        self iprintlnsp( "^:Pro Mod: ^7[^2On^7]" );
	}
	else {
        self VisionSetNakedForPlayer( level.map_name, 0.5 );
        executeCommand( "player_breath_snd_delay 1" );
        executeCommand( "perk_extraBreath 5" );
        executeCommand( "cg_brass 1" );
        executeCommand( "r_blur 0" );
        executeCommand( "r_specularcolorscale 1" );
        executeCommand( "r_filmusetweaks 0" );
        executeCommand( "r_filmtweakenable 0" );
        executeCommand( "r_filmtweakcontrast 1.4" );
        executeCommand( "r_brightness 0" );
        executeCommand( "fx_drawclouds 1" );
        executeCommand( "cg_blood 1" );
        executeCommand( "r_dlightLimit 8" );
        executeCommand( "r_fog 1" );
        level.pro_mod = false;
        self iprintlnsp( "^:Pro Mod: ^7[^1Off^7]" );
	}
}

disable_timer() {
    level notify( "kill_timer" );
    if ( isdefined( level.timer ) ) {
        maps\_hud_util::destroy_countdown_hud( level.timer );
    }
    self iprintlnsp( "^:Timer: ^7[^2Disabled^7]" );
}

disable_friendly_fire() {
    self.disable_friendly_fire = !( isdefined( self.disable_friendly_fire ) && self.disable_friendly_fire );

	if( level.disable_friendly_fire == false ) {
        executeCommand( "friendlyfire_dev_disabled 1" );
        level.disable_friendly_fire = true;
        self iprintlnsp( "^:Friendly Fire: ^7[^2On^7]" );
	}
	else {
        executeCommand( "friendlyfire_dev_disabled 0" );
        level.disable_friendly_fire = false;
        self iprintlnsp( "^:Friendly Fire: ^7[^1Off^7]" );
	}
}

cluster_nades() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.cluster_nades = !( isdefined( self.cluster_nades ) && self.cluster_nades );

	if( level.cluster_nades == false ) {
        level.player thread maps\_cheat::wait_for_grenades();
        level.cluster_nades = true;
        self iprintlnsp( "^:Cluster Grenades: ^7[^2On^7]" );
	}
	else {
        level notify( "end_cluster_grenades" );
        level.cluster_nades = false;
        self iprintlnsp( "^:Cluster Grenades: ^7[^1Off^7]" );
	}
}

slowmo_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.slowmo_mode = !( isdefined( self.slowmo_mode ) && self.slowmo_mode );

	if( level.slowmo_mode == false ) {
        level.slowmo thread maps\_cheat::gamespeed_proc();
        level.player allowmelee( 0 );
        thread maps\_cheat::slowmo_hintprint();
        level.slowmo_mode = true;
        self iprintlnsp( "^:Slowmo Mode: ^7[^2On^7]" );
	}
	else {
        level notify( "disable_slowmo" );
        level.player allowmelee( 1 );
        level.slowmo thread maps\_cheat::gamespeed_reset();
        level.cheatshowslowmohint = 0;
        level.slowmo_mode = false;
        self iprintlnsp( "^:Slowmo Mode: ^7[^1Off^7]" );
	}
}

tire_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.tire_mode = !( isdefined( self.tire_mode ) && self.tire_mode );

	if( level.tire_mode == false ) {
        level.tire_explosion = 1;
        level.tire_mode = true;
        self iprintlnsp( "^:Tire Mode: ^7[^2On^7]" );
	}
	else {
        level.tire_explosion = 0;
        level.tire_mode = false;
        self iprintlnsp( "^:Tire Mode: ^7[^1Off^7]" );
	}
}

chaplin_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.chaplin_mode = !( isdefined( self.chaplin_mode ) && self.chaplin_mode );

	if( level.chaplin_mode == false ) {
        maps\_cheat::chaplinmode(1);
        level.chaplin_mode = true;
        self iprintlnsp( "^:Chaplin Mode: ^7[^2On^7]" );
	}
	else {
        maps\_cheat::chaplinmode(0);
        level.chaplin_mode = false;
        self iprintlnsp( "^:Chaplin Mode: ^7[^1Off^7]" );
	}
}

ragdoll_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.ragdoll_mode = !( isdefined( self.ragdoll_mode ) && self.ragdoll_mode );

	if( level.ragdoll_mode == false ) {
        level.cheat_super_ragdoll = 1;
        level.ragdoll_mode = true;
        self iprintlnsp( "^:Ragdoll Mode: ^7[^2On^7]" );
	}
	else {
        level.cheat_super_ragdoll = 0;
        level.ragdoll_mode = false;
        self iprintlnsp( "^:Ragdoll Mode: ^7[^1Off^7]" );
	}
}

melonhead_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.melonhead_mode = !( isdefined( self.melonhead_mode ) && self.melonhead_mode );

	if( level.melonhead_mode == false ) {
        level.melonhead_mode_enabled = 1;
        level.melonhead_mode = true;
        self iprintlnsp( "^:Melon Head Mode: ^7[^2On^7]" );
	}
	else {
        level.melonhead_mode_enabled = 0;
        level.melonhead_mode = false;
        self iprintlnsp( "^:Melon Head Mode: ^7[^1Off^7]" );
	}
}

tracksuit_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.tracksuit_mode = !( isdefined( self.tracksuit_mode ) && self.tracksuit_mode );

	if( level.tracksuit_mode == false ) {
        level.tracksuit_mode_enabled = 1;
        level notify( "tracksuit_mode_updated" );
        level.tracksuit_mode = true;
        self iprintlnsp( "^:Tracksuit Mode: ^7[^2On^7]" );
	}
	else {
        level.tracksuit_mode_enabled = 0;
        level notify( "tracksuit_mode_updated" );
        level.tracksuit_mode = false;
        self iprintlnsp( "^:Tracksuit Mode: ^7[^1Off^7]" );
	}
}

lemonade_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.lemonade_mode = !( isdefined( self.lemonade_mode ) && self.lemonade_mode );

	if( level.lemonade_mode == false ) {
        maps\_cheat::givelemonade();
        level.lemonade_mode = true;
        self iprintlnsp( "^:Lemonade Mode: ^7[^2On^7]" );
	}
	else {
        maps\_cheat::takelemonade();
        level.lemonade_mode = false;
        self iprintlnsp( "^:Lemonade Mode: ^7[^1Off^7]" );
	}
}

invulnerable( var_0 ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    if ( var_0 == 0 ) {
        if ( isdefined( self.magic_bullet_shield ) )
            maps\_utility::stop_magic_bullet_shield();
    }
    else if ( !isdefined( self.magic_bullet_shield ) ) {
        thread maps\_utility::magic_bullet_shield();
    }
    self.a.disablepain = var_0;
}

kill_entity() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    if ( !isdefined( self ) ) {
        return;
    }
    if ( !isalive( self ) ) {
        return;
    }
    self.allowdeath = 1;
    invulnerable( 0 );
    self kill();
}

kill_allied_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    allies_array = getaiarray( "allies" );

    foreach( ally in allies_array ) {
        ally kill_entity();
    }
    self iprintlnsp( "^:All Allies Killed!" );
}

kill_enemy_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    enemy_array = getaiarray( "axis" );

    foreach( enemy in enemy_array ) {
        enemy kill_entity();
    }
    self iprintlnsp( "^:All Enemies Killed!" );
}

kill_all_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ai_array = getaiarray();

    foreach( ai in ai_array ) {
        ai kill_entity();
    }
    self iprintlnsp( "^:All AI Killed!" );
}

delete_allied_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    allies_array = getaiarray( "allies" );

    foreach( ally in allies_array ) {
        maps\_utility::deleteent( ally );
    }
    self iprintlnsp( "^:All Allies Deleted!" );
}

delete_enemy_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    enemy_array = getaiarray( "axis" );

    foreach( enemy in enemy_array ) {
        maps\_utility::deleteent( enemy );
    }
    self iprintlnsp( "^:All Enemies Deleted!" );
}

delete_all_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ai_array = getaiarray();

    foreach( ai in ai_array ) {
        maps\_utility::deleteent( ai );
    }
    self iprintlnsp( "^:All AI Deleted!" );
}

teleport_allied_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    allies_array = getaiarray( "allies" );

    foreach( ally in allies_array ) {
        ally forceteleport( aim()[ "position" ] + ( 0, 0, 1 ) );
    }
    self iprintlnsp( "^:All Allies Teleported!" );
}

teleport_enemy_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    enemy_array = getaiarray( "axis" );

    foreach( enemy in enemy_array ) {
        enemy forceteleport( aim()[ "position" ] + ( 0, 0, 1 ) );
    }
    self iprintlnsp( "^:All Enemies Teleported!" );
}

teleport_all_ai() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ai_array = getaiarray();

    foreach( ai in ai_array ) {
        ai forceteleport( aim()[ "position" ] + ( 0, 0, 1 ) );
    }
    self iprintlnsp( "^:All AI Teleported!" );
}

teleport_all_ents() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ent_array = getentarray();

    foreach( ent in ent_array ) {
        if( ent != level.player ) {
            ent forceteleport( aim()[ "position" ] + ( 0, 0, 1 ) );
        }
    }
    self iprintlnsp( "^:All Ents Teleported!" );
}

cqb_walk_allies_toggle() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.cqb_walk_allies_toggle = !( isdefined( self.cqb_walk_allies_toggle ) && self.cqb_walk_allies_toggle );

    allies_array = getaiarray( "allies" );

	if( level.cqb_walk_allies_toggle == false ) {
        foreach( ally in allies_array ) {
            ally maps\_utility::cqb_walk( "on" );
        }
        level.cqb_walk_allies_toggle = true;
        self iprintlnsp( "^:Allies CQB Walk: ^7[^2On^7]" );
	}
	else {
        foreach( ally in allies_array ) {
            ally maps\_utility::cqb_walk( "" );
        }
        level.cqb_walk_allies_toggle = false;
        self iprintlnsp( "^:Allies CQB Walk: ^7[^1Off^7]" );
	}
}

cqb_walk_axis_toggle() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.cqb_walk_axis_toggle = !( isdefined( self.cqb_walk_axis_toggle ) && self.cqb_walk_axis_toggle );

    axis_array = getaiarray( "axis" );

	if( level.cqb_walk_axis_toggle == false ) {
        foreach( axis in axis_array ) {
            axis maps\_utility::cqb_walk( "on" );
        }
        level.cqb_walk_axis_toggle = true;
        self iprintlnsp( "^:Axis CQB Walk: ^7[^2On^7]" );
	}
	else {
        foreach( axis in axis_array ) {
            axis maps\_utility::cqb_walk( "" );
        }
        level.cqb_walk_axis_toggle = false;
        self iprintlnsp( "^:Axis CQB Walk: ^7[^1Off^7]" );
	}
}

delete_all_ents() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ent_array = getentarray();

    foreach( ent in ent_array ) {
        if( ent != level.player ) {
            maps\_utility::deleteent( ent );
        }
    }
    self iprintlnsp( "^:All Ents Deleted!" );
}

delete_all_script_models() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    script_model_array = getentarray( "script_model", "classname" );

    foreach( script_model in script_model_array ) {
        maps\_utility::deleteent( script_model );
    }
    self iprintlnsp( "^:All Script Models Deleted!" );
}

delete_all_script_brushmodels() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    script_brushmodel_array = getentarray( "script_brushmodel", "classname" );

    foreach( script_brushmodel in script_brushmodel_array ) {
        maps\_utility::deleteent( script_brushmodel );
    }
    self iprintlnsp( "^:All Script Brush Models Deleted!" );
}

delete_all_script_vehicles() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    script_vehicle_array = getentarray( "script_vehicle", "code_classname" );

    foreach( script_vehicle in script_vehicle_array ) {
        maps\_utility::deleteent( script_vehicle );
    }
    self iprintlnsp( "^:All Script Vehicles Deleted!" );
}

toggle_dof() {
    self.toggle_dof = !( isdefined( self.toggle_dof ) && self.toggle_dof );

	if( level.toggle_dof == false ) {
        executeCommand( "r_dof_tweak 2" );
        level.toggle_dof = true;
        self iprintlnsp( "^:Disable Depth Of Field: ^7[^2On^7]" );
	}
	else {
        executeCommand( "r_dof_tweak 0" );
        level.toggle_dof = false;
        self iprintlnsp( "^:Disable Depth Of Field: ^7[^1Off^7]" );
	}
}

toggle_shiny_mode() {
    self.toggle_shiny_mode = !( isdefined( self.toggle_shiny_mode ) && self.toggle_shiny_mode );

	if( level.toggle_shiny_mode == false ) {
        executeCommand( "r_specularmap 2" );
        level.toggle_shiny_mode = true;
        self iprintlnsp( "^:Shiny Mode: ^7[^2On^7]" );
	}
	else {
        executeCommand( "r_specularmap 1" );
        level.toggle_shiny_mode = false;
        self iprintlnsp( "^:Shiny Mode: ^7[^1Off^7]" );
	}
}

tornado_start()
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    self thread tornado_toggle();
}

tornado_toggle() 
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    if( !isDefined( level.tornado_building ) && !isDefined( level.tornado_spawned ) ) {
        if( !isDefined( level.tornado_building ) ) {
            if( !isDefined( level.tornado_spawned ) ) {
                level.tornado_building = true;
                self iprintlnsp( "^:Tornado Spawned!" );
                self thread tornado();
            }
        }
        else {
            self iprintlnsp( "^1The Tornado Is Currently Building!" );
        }
    }
    else {
        if( !isDefined( level.tornado_building ) ) {
            if( isDefined( level.tornado_spawned ) ) {
                if( !isDefined( level.tornado_nuked ) ) {
                    for( i = 0; i < level.tornado_parts.size; i++ ) {
                        level.tornado_parts[ i ] delete();
                    }
                    level.tornado_spawned = undefined;
                    self iprintlnsp( "^:Tornado ^1Destroyed^:!" );
                }
            }
        }
    }
}

tornado() 
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    ents = GetEntArray( "script_model","classname" );
    for( i = 0; i < ents.size; i++ ) {
        ents[ i ] thread tornado_watch_ents();
    }
    level.tornado_fx    =  random( level.smoke_array );
    level.tornado_parts = [];
    level.tornado_time  = 0;
    level.tornado_parts[ 0 ] = spawn_scriptmodel( self.origin, "tag_origin" );
    for( i = 1; i < 22; i++ ) {
        level.tornado_parts[ i ] = spawn_scriptmodel( level.tornado_parts[ 0 ].origin + ( i * 5, i * 5, i * 25 ), "tag_origin" );
        level.tornado_parts[ i ] LinkTo( level.tornado_parts[ 0 ] );
    }
    level.tornado_parts[ 0 ] thread tornado_rotate_yaw( 360, .5 );
    foreach( player in level.players ) {
        player thread tornado_watch_players();
    }
    level.tornado_spawned = true;
    level.tornado_building = undefined;
    level.tornado_parts[ 0 ] thread tornado_movement();
    level.tornado_parts[ 0 ] thread tornado_movement_watch( level.tornado_parts[ 0 ].origin );
    thread tornado_monitor_time();
    while( isDefined( level.tornado_spawned ) ) {
        if( level.tornado_time <= 650 ) {
            level.tornado_time++;
        }
        for( i = 1; i < level.tornado_parts.size; i++ ) {
            PlayFXOnTag( level.tornado_fx, level.tornado_parts[ i ], "tag_origin" );
        }
        wait 0.05;
    }
}

tornado_movement() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "EndTornadoMovement" );
    while( isDefined( level.tornado_spawned ) && !isDefined( level.tornado_nuked ) ) {
        random_origin1 = RandomIntRange( -100, 100 );
        random_origin2 = RandomIntRange( -100, 100 );
        self MoveTo( self.origin + ( random_origin1, random_origin2, 0 ), 0.5 );
        wait 0.5;
    }
}

tornado_movement_watch( origin ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    while( isDefined( level.tornado_spawned ) && !isDefined( level.tornado_nuked ) ) {
        if( Distance( origin, self.origin ) >= 750 ) {
            self notify( "EndTornadoMovement" );
            self MoveTo( origin, 3 );
            wait 3;
            self thread tornado_movement();
        }
        wait 0.05;
    }
}

tornado_monitor_time() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    while( isDefined( level.tornado_spawned ) && !isDefined( level.tornado_nuked ) ) {
        if( level.tornado_time >= 350 && level.tornado_time < 650 ) {
            for( i = 1; i < level.tornado_parts.size; i++ ) {
                PlayFXOnTag( random( level.smoke_array ), level.tornado_parts[ i ], "tag_origin" );
            }
        }
        else {
            if( level.tornado_time >= 650 )  {
                level.tornado_fx = random( level.smoke_array );
                break;
            }
        }
        wait 0.05;
    }
}

tornado_watch_players() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    wait 1;
    while( isDefined( level.tornado_spawned ) && !isDefined( level.tornado_nuked ) ) {
        if( Distance( level.tornado_parts[ 0 ].origin, self.origin ) <= 175 && !isDefined( level.TornadoIgnorePlayers ) ) {
            for( i = 1; i < level.tornado_parts.size; i++ ) {
                self PlayerLinkTo( level.tornado_parts[ i ], "tag_origin" );
                wait 0.05;
            }
            self Unlink();
            self SetVelocity( ( 450, 450, 850 ) );
        }
        wait 0.05;
    }
}

tornado_watch_ents() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    wait 1;
    while( isDefined( level.tornado_spawned ) && !isDefined( level.tornado_nuked ) ) {
        if( Distance( level.tornado_parts[ 0 ].origin, self.origin ) <= 175 && !isDefined( level.TornadoIgnoreEntities ) ) {
            for( i = 1; i < level.tornado_parts.size; i++ ) {
                self.origin = level.tornado_parts[ i ].origin;
                wait 0.05;
            }
            linker = spawn_scriptmodel( self.origin,"tag_origin" );
            self LinkTo( linker );
            linker PhysicsLaunchServer( linker.origin, AnglesToForward( self.angles ) * 15000 );
            wait 9;
            linker delete();
        }
        wait 0.05;
    }
}

tornado_rotate_yaw( inc, time ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    while( isDefined( self ) && !isDefined( level.tornado_nuked ) ) {
        self RotateYaw( inc, time );
        wait time;
    }
}

toggle_multi_jump() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_multi_jump = !( isdefined( self.toggle_multi_jump ) && self.toggle_multi_jump );

	if( level.toggle_multi_jump == false ) {
        self endon( "endMultiJump" );
        if( !isDefined( self.numOfMultijumps ) ) {
            self.numOfMultijumps = 999;
        }

        level.player thread monitor_multi_jump();
        level.player thread monitor_player_landed();

        level.toggle_multi_jump = true;
        self iprintlnsp( "^:Multi-Jump: ^7[^2On^7]" );
	}
	else {
        self notify( "endMultiJump" );
        level.toggle_multi_jump = false;
        self iprintlnsp( "^:Multi-Jump: ^7[^1Off^7]" );
	}
}

monitor_multi_jump() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endMultiJump" );
    for(;;) {
        currentNum = 0;
        while( !self jumpbuttonpressed() ) {
            wait 0.05;
        }
        while( self jumpbuttonpressed() ) {
            wait 0.05;
        }
        if( getDvarInt( "jump_height" ) > 250 ) {
            continue;
        }
        if ( !self isOnGround() ) {
            while( !self isOnGround() && isAlive( self ) && currentNum < self.numOfMultijumps ) {
                waittillResult = self waittill_any_timeout( 0.11, "landedOnGround", "death" );
                while( waittillResult == "timeout" ) {
                    if( self jumpbuttonpressed() ) {
                        waittillResult = "jump";
                        break;
                    }
                    waittillResult = self waittill_any_timeout( 0.05, "landedOnGround", "death" );
                }
                if( waittillResult == "jump" && !self isOnGround() && isAlive( self ) ) {
                    playerAngles = self getplayerangles();
                    playerVelocity = self getVelocity();
                    self setvelocity( ( playerVelocity[ 0 ], playerVelocity[ 1 ], playerVelocity[ 2 ] / 2 ) + anglestoforward( ( 270, playerAngles[ 1 ], playerAngles[ 2 ] ) ) * getDvarInt( "jump_height" ) * ( ( ( -1 / 39 ) * getDvarInt( "jump_height" ) ) + ( 17 / 2 ) ) );
                    currentNum++;
                    while( self jumpbuttonpressed() ) {
                        wait 0.05;
                    }
                }
                else {
                    break;
                }
            }
            while( !self isOnGround() ) {
                wait 0.05;
            }
        }
    }
}

monitor_player_landed() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endMultiJump" );
    loopResult = true;
    for(;;) {
        wait 0.05;
        newResult = self isOnGround();
        if( newResult != loopResult ) {
            if( !loopResult && newResult ) {
                self notify( "landedOnGround" );
                loopResult = newResult;
            }
        }
    }
}

toggle_enemy_kill_aura() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_enemy_kill_aura = !( isdefined( self.toggle_enemy_kill_aura ) && self.toggle_enemy_kill_aura );

	if( level.toggle_enemy_kill_aura == false ) {
        level.player thread monitor_enemy_kill_aura();
        level.toggle_enemy_kill_aura = true;
        self iprintlnsp( "^:Kill Aura: ^1Enemies^:: ^7[^2On^7]" );
	}
	else {
        self notify( "endEnemyKillAura" );
        level.toggle_enemy_kill_aura = false;
        self iprintlnsp( "^:Kill Aura: ^1Enemies^:: ^7[^1Off^7]" );
	}
}

toggle_all_kill_aura() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_all_kill_aura = !( isdefined( self.toggle_all_kill_aura ) && self.toggle_all_kill_aura );

	if( level.toggle_all_kill_aura == false ) {
        level.player thread monitor_all_kill_aura();
        level.toggle_all_kill_aura = true;
        self iprintlnsp( "^:Kill Aura: ^1All^:: ^7[^2On^7]" );
	}
	else {
        self notify( "endAllKillAura" );
        level.toggle_all_kill_aura = false;
        self iprintlnsp( "^:Kill Aura: ^1All^:: ^7[^1Off^7]" );
	}
}

monitor_enemy_kill_aura() {
    self endon( "game_ended" );
    self endon( "disconnect" );
	self endon( "endEnemyKillAura" );
	while( 1 ) {
        enemy_array = getaiarray( "axis" );
		foreach( enemy in enemy_array ) {
            if( isalive( enemy ) && enemy != level.player && distance( enemy.origin, level.player.origin ) <= 300 ) {
                enemy kill_entity();
            }
        }
        wait 0.05;
	}
}

monitor_all_kill_aura() {
    self endon( "game_ended" );
    self endon( "disconnect" );
	self endon( "endAllKillAura" );
	while( 1 ) {
        ai_array = getaiarray();
		foreach( ai in ai_array ) {
            if( isalive( ai ) && ai != level.player && distance( ai.origin, level.player.origin ) <= 300 ) {
                ai kill_entity();
            }
        }
        wait 0.05;
	}
}

toggle_explosive_rounds() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_explosive_rounds = !( isdefined( self.toggle_explosive_rounds ) && self.toggle_explosive_rounds );

	if( level.toggle_explosive_rounds == false ) {
        level.toggle_explosive_rounds = true;
        self iprintlnsp( "^:Explosive Rounds: ^7[^2On^7]" );
        for(;;) {
            self endon( "endExplosiveRounds" );
            self waittill( "weapon_fired" );
            self playsound( "h1_wpn_rpg_exp_default" );
            playfx( level._effect[ "frag_grenade_default" ], aim()[ "position" ] );
            playfx( random( level.smoke_array ), aim()[ "position" ] );
            _radiusdamage( aim()[ "position" ], 160, 160, 160, self );
        }
	}
	else {
        self notify( "endExplosiveRounds" );
        level.toggle_explosive_rounds = false;
        self iprintlnsp( "^:Explosive Rounds: ^7[^1Off^7]" );
	}
}

toggle_blood_guns() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_blood_guns = !( isdefined( self.toggle_blood_guns ) && self.toggle_blood_guns );

	if( level.toggle_blood_guns == false ) {
        level.toggle_blood_guns = true;
        self iprintlnsp( "^:Blood Gun: ^7[^2On^7]" );
        for(;;) {
            self endon( "endBloodGun" );
            self waittill( "weapon_fired" );
            self playsound( "melee_knife_hit_watermelon" );
            playfx( level._effect[ "blood_hit_knife" ], aim()[ "position" ] );
            playfx( level._effect[ "blood_hit_knife" ], aim()[ "position" ] + ( 10, 10, 0 ) );
            playfx( level._effect[ "blood_hit_knife" ], aim()[ "position" ] - ( 10, 10, 0 ) );
            playfx( level._effect[ "blood_hit_knife" ], aim()[ "position" ] + ( -10, -10, 0 ) );
            playfx( level._effect[ "blood_hit_knife" ], aim()[ "position" ] - ( -10, -10, 0 ) );
            playfx( level._effect[ "blood_on_riotshield" ], aim()[ "position" ] );
            playfx( level._effect[ "blood_on_riotshield" ], aim()[ "position" ] + ( 10, 10, 0 ) );
            playfx( level._effect[ "blood_on_riotshield" ], aim()[ "position" ] - ( 10, 10, 0 ) );
            playfx( level._effect[ "blood_on_riotshield" ], aim()[ "position" ] + ( -10, -10, 0 ) );
            playfx( level._effect[ "blood_on_riotshield" ], aim()[ "position" ] - ( -10, -10, 0 ) );
            playfx( level._effect[ "blood_smear_decal" ], aim()[ "position" ] );
            playfx( level._effect[ "blood_smear_decal" ], aim()[ "position" ] + ( 10, 10, 0 ) );
            playfx( level._effect[ "blood_smear_decal" ], aim()[ "position" ] - ( 10, 10, 0 ) );
            playfx( level._effect[ "blood_smear_decal" ], aim()[ "position" ] + ( -10, -10, 0 ) );
            playfx( level._effect[ "blood_smear_decal" ], aim()[ "position" ] - ( -10, -10, 0 ) );
        }
	}
	else {
        self notify( "endBloodGun" );
        level.toggle_blood_guns = false;
        self iprintlnsp( "^:Blood Gun: ^7[^1Off^7]" );
	}
}

restart_no_game() {
    self close_menu();
    self iprintlnsp( "^:Disable With Console Command: ^1start default; fast_restart", 15 );
    wait 5;
    self iprintlnsp( "^1start default; fast_restart", 20, 2.5 );
    wait 5;
    executeCommand( "start no_game; fast_restart" );
}

set_sun_color( color, name ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    if( level.toggle_disco_sun == true ) {
        toggle_disco_sun();
    }
    if( name != "^7Default" ) {
        executeCommand( "r_filmusetweaks 1; r_filmTweakenable 1; r_filmTweakbrightness 0.2; r_filmtweakLighttint " + color );
        self iprintlnsp( "^:Sun Color Set: " + name );
	}
    else {
        executeCommand( "r_filmusetweaks 0; r_filmTweakenable 0; r_filmTweakbrightness 0; r_filmtweakLighttint " + color );
        self iprintlnsp( "^:Sun Color Set: " + name );
    }
}

toggle_disco_sun() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_disco_sun = !( isdefined( self.toggle_disco_sun ) && self.toggle_disco_sun );

	if( level.toggle_disco_sun == false ) {
        executeCommand( "r_filmusetweaks 1; r_filmTweakenable 1; r_filmTweakbrightness 0.2" );
        level.toggle_disco_sun = true;
        self iprintlnsp( "^:Disco Sun: ^7[^2On^7]" );
        for(;;) {
            self endon( "endDiscoSun" );
            level.discox = randomFloatRange( 0.0, 2.0 );
        	level.discoy = randomFloatRange( 0.0, 2.0 );
        	level.discoz = randomFloatRange( 0.0, 2.0 );

        	executeCommand( "r_filmtweakLighttint " + level.discox + " " + level.discoy + " " + level.discoz );
        	wait 0.14;
        }
	}
	else {
        self notify( "endDiscoSun" );
        executeCommand( "r_filmusetweaks 0; r_filmTweakenable 0; r_filmTweakbrightness 0; r_filmtweakLighttint 1.1 1.05 0.85" );
        level.toggle_disco_sun = false;
        self iprintlnsp( "^:Disco Sun: ^7[^1Off^7]" );
	}
}

set_vision( vision ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    if( level.toggle_disco_sun == true ) {
        toggle_disco_sun();
    }
    if( vision != "^7Default" ) {
        executeCommand( "r_filmusetweaks 0; r_filmTweakenable 0; r_filmTweakbrightness 0; r_filmtweakLighttint 1.1 1.05 0.85" );
        self VisionSetNakedForPlayer( vision, 0.5 );
        self iprintlnsp( "^:Vision Set: " + vision );
	}
    else {
        executeCommand( "r_filmusetweaks 0; r_filmTweakenable 0; r_filmTweakbrightness 0; r_filmtweakLighttint 1.1 1.05 0.85" );
        self VisionSetNakedForPlayer( level.map_name, 0.5 );
        self iprintlnsp( "^:Vision Set: " + vision );
    }
}

toggle_drawgun() {
    self.toggle_drawgun = !( isdefined( self.toggle_drawgun ) && self.toggle_drawgun );

	if( level.toggle_drawgun == false ) {
        executeCommand( "cg_drawgun 0" );
        level.toggle_drawgun = true;
        self iprintlnsp( "^:Disable View Model: ^7[^2On^7]" );
	}
	else {
        executeCommand( "cg_drawgun 1" );
        level.toggle_drawgun = false;
        self iprintlnsp( "^:Disable View Model: ^7[^1Off^7]" );
	}
}

toggle_notarget() {
    self.toggle_notarget = !( isdefined( self.toggle_notarget ) && self.toggle_notarget );

	if( level.toggle_notarget == false ) {
        executeCommand( "notarget" );
        level.player.ignoreme = true;
        level.toggle_notarget = true;
        self iprintlnsp( "^:Invisible Player (notarget): ^7[^2On^7]" );
	}
	else {
        executeCommand( "notarget" );
        level.player.ignoreme = false;
        level.toggle_notarget = false;
        self iprintlnsp( "^:Invisible Player (notarget): ^7[^1Off^7]" );
	}
}

toggle_grappling_gun() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_grappling_gun = !( isdefined( self.toggle_grappling_gun ) && self.toggle_grappling_gun );

    if( level.toggle_teleport_gun == true ) {
            toggle_teleport_gun();
    }

	if( level.toggle_grappling_gun == false ) {
        level.toggle_grappling_gun = true;
        self iprintlnsp( "^:Grappling Gun: ^7[^2On^7]" );
        self giveWeapon( "defaultweapon" );
	    self switchToWeapon( "defaultweapon" );
        for(;;) {
            self endon( "endGrapplingGun" );
            self waittill( "weapon_fired" );
            if( self getCurrentWeapon() == "defaultweapon" ) {
                level.player playsound( "fastrope_start_npc" );
                grappler = spawn( "script_model", level.player.origin );
                level.player playerlinkto( grappler );
                grappler moveTo( aim()[ "position" ], 1 );
                wait 1.02;
                level.player unlink();
                grappler delete();
            }
        }
	}
	else {
        self notify( "endGrapplingGun" );
        self takeWeapon( "defaultweapon" );
        level.toggle_grappling_gun = false;
        self iprintlnsp( "^:Grappling Gun: ^7[^1Off^7]" );
	}
}

toggle_teleport_gun() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_teleport_gun = !( isdefined( self.toggle_teleport_gun ) && self.toggle_teleport_gun );

    if( level.toggle_grappling_gun == true ) {
        toggle_grappling_gun();
    }

	if( level.toggle_teleport_gun == false ) {
        level.toggle_teleport_gun = true;
        self iprintlnsp( "^:Instant Transmission: ^7[^2On^7]" );
        self giveWeapon( "defaultweapon" );
	    self switchToWeapon( "defaultweapon" );
        for(;;) {
            self endon( "endTeleportGun" );
            self waittill( "weapon_fired" );
            if( self getCurrentWeapon() == "defaultweapon" ) {
                level.player playsound( "arcademode_extralife" );
                level.player SetOrigin( aim()[ "position" ] + ( 0, 0, 15 ) );
            }
        }
	}
	else {
        self notify( "endTeleportGun" );
        self takeWeapon( "defaultweapon" );
        level.toggle_teleport_gun = false;
        self iprintlnsp( "^:Instant Transmission: ^7[^1Off^7]" );
	}
}

rocket_barrage() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    enemy_array = getaiarray( "axis" );

    foreach( enemy in enemy_array ) {
        magicBullet( "rpg", enemy.origin + (0, 0, 4000), enemy getTagOrigin("j_spineupper"));
    }
    self iprintlnsp( "^:Missile Salvo Launched!" );
}

toggle_jetpack() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_jetpack = !( isdefined( self.toggle_jetpack ) && self.toggle_jetpack );

	if( level.toggle_jetpack == false ) {
        self endon( "endJetpack" );
        level.toggle_jetpack = true;
        self iprintlnsp( "^:Jetpack: ^7[^2On^7]" );
        self.fuel = 500;
		wait 1;
		self iprintlnsp( "^:Hold ^3[{+activate}] ^:To Use Jetpack" );
        for( i = 0 ;  ; i++ ) {
            if( self usebuttonpressed() && self.fuel > 0 ) {
                level.player playsound( "slide_start_plr_default" );
                playFx( random( level.smoke_array ), level.player.origin - ( 0, 0, 10) );
                earthquake( .15, .2, level.player gettagorigin( "j_spineupper" ), 50 );
                self.fuel--;
                if( self getvelocity() [2] < 300 ) {
                    self setvelocity( self getvelocity() + ( 0, 0, 60 ) );
                }
            }
            if( self.fuel < 500 && !self usebuttonpressed() ) {
                self.fuel++;
            }
            wait 0.05;
        }
	}
	else {
        self notify( "endJetpack" );
        level.toggle_jetpack = false;
        self iprintlnsp( "^:Jetpack: ^7[^1Off^7]" );
	}
}

toggle_all_perks() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_all_perks = !( isdefined( self.toggle_all_perks ) && self.toggle_all_perks );

	if( level.toggle_all_perks == false ) {
        foreach( perk in level.perk_array ) {
            level.player giveperk( perk, false );
        }
        level.toggle_all_perks = true;
        self iprintlnsp( "^:All Perks: ^7[^2On^7]" );
	}
	else {
        level.player _clearperks();
        level.toggle_all_perks = false;
        self iprintlnsp( "^:All Perks: ^7[^1Off^7]" );
	}
}

toggle_unlimited_stock() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_unlimited_stock = !( isdefined( self.toggle_unlimited_stock ) && self.toggle_unlimited_stock );

	if( level.toggle_unlimited_stock == false ) {
        level.toggle_unlimited_stock = true;
        self iprintlnsp( "^:Unlimited Ammo Stock: ^7[^2On^7]" );
        for(;;) {
            self endon( "endUnlimitedStock" );
            self waittill( "weapon_fired" || "grenade_fire" );
            currentWeapon = self GetCurrentWeapon();
		    self setWeaponAmmoStock( currentWeapon, 999 );
		    wait 0.05;
        }
	}
	else {
        self notify( "endUnlimitedStock" );
        level.toggle_unlimited_stock = false;
        self iprintlnsp( "^:Unlimited Ammo Stock: ^7[^1Off^7]" );
	}
}

toggle_unlimited_equipment() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_unlimited_equipment = !( isdefined( self.toggle_unlimited_equipment ) && self.toggle_unlimited_equipment );

	if( level.toggle_unlimited_equipment == false ) {
        level.toggle_unlimited_equipment = true;
        self iprintlnsp( "^:Unlimited Equipment: ^7[^2On^7]" );
        for(;;) {
            self endon( "endUnlimitedEquipment" );
            self waittill( "grenade_fire" || "weapon_fired" );
            currentOffhand = self getCurrentOffhand();
            self setWeaponAmmoClip( currentOffhand, 99 );
		    self giveMaxAmmo( currentOffhand );
            self setWeaponAmmoClip( "fraggrenade", 99 );
            self GiveMaxAmmo( "fraggrenade" );
            self setWeaponAmmoClip( "flash_grenade", 99 );
            self GiveMaxAmmo( "flash_grenade" );
		    wait 0.05;
        }
	}
	else {
        self notify( "endUnlimitedEquipment" );
        level.toggle_unlimited_equipment = false;
        self iprintlnsp( "^:Unlimited Equipment: ^7[^1Off^7]" );
	}
}

toggle_forge_mode() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_forge_mode = !( isdefined( self.toggle_forge_mode ) && self.toggle_forge_mode );

	if( level.toggle_forge_mode == false ) {
        level.toggle_forge_mode = true;
        self iprintlnsp( "^:Forge Mode: ^7[^2On^7]" );
        executeCommand( "r_dof_tweak 2" );
        level.player thread forge_controls();
        level.player thread forge_mode_loop();
        wait 2.1;
		self iprintlnsp( "^:Press ^1[{+actionslot 1}] ^:For Controls!", 6 );
	}
	else {
        self notify( "endForgeMode" );
        level.toggle_forge_mode = false;
        self iprintlnsp( "^:Forge Mode: ^7[^1Off^7]" );
        executeCommand( "r_dof_tweak 0" );
	}
}

forge_controls() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endForgeMode" );
    for(;;) {
        notifyoncommand( "forge_controls", "+actionslot 1" );
        self waittill( "forge_controls" );
        self iprintlnsp( "^:Hold [{+speed_throw}] To ^1Pick Up ^:Objects", 15 );
        wait 3;
        self iprintlnsp( "^:Press [{+attack}], [{+frag}], Or [{+smoke}] To ^1Rotate ^:Objects", 25 );
        wait 6;
        self iprintlnsp( "^:Press [{+gostand}] To ^1Launch ^:Physics Objects", 15 );
        wait 6;
        self iprintlnsp( "^:Press [{+activate}] To ^1Delete ^:Objects", 15 );
    }
}

forge_mode_loop() {
    self endon( "game_ended" );
    self endon( "disconnect" );
	self endon( "endForgeMode" );
	while( true ) {
        forwardTrace = self getEye() + ( anglestoforward( self getPlayerAngles() ) * 1000000 );
        traceResult = bulletTrace( self getEye(), forwardTrace, false, self );
		if( isDefined( traceResult[ "entity" ] ) ) {
			while( self adsButtonPressed() ) {
				traceResult[ "entity" ] moveTo( level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175 );
				traceResult[ "entity" ].origin = level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175;
				wait 0.05;
				if( self attackButtonPressed() ) {
					while( self attackButtonPressed() ) {
						traceResult[ "entity" ] rotatePitch( 1, 0.01 );
						traceResult[ "entity" ] moveTo( level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175 );
				        traceResult[ "entity" ].origin = level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175;
						wait 0.05;
					}
				}
				if( self fragButtonPressed() ) {
					while( self fragButtonPressed() ) {	 
						traceResult[ "entity" ] rotateYaw( 1, 0.01 );
						traceResult[ "entity" ] moveTo( level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175 );
				        traceResult[ "entity" ].origin = level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175;
						wait 0.05;
					}
				}
				if( self secondaryOffhandButtonPressed() ) {
					while( self secondaryOffhandButtonPressed() ) {	 
						traceResult[ "entity" ] rotateRoll( 1, 0.01 );
						traceResult[ "entity" ] moveTo( level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175 );
				        traceResult[ "entity" ].origin = level.player.origin + ( 0, 0, 60 ) + anglesToForward( level.player getPlayerAngles() ) * 175;
						wait 0.05;
					}
				}
                if( self jumpButtonPressed() ) {
					traceResult[ "entity" ] PhysicsLaunchServer( level.player.origin + ( 0, 0, 60 ), anglesToForward( level.player getPlayerAngles() ) * 17500 );
					wait 0.05;
				}
				if( !isPlayer( traceResult[ "entity" ] ) && self useButtonPressed() ) {
					traceResult[ "entity" ] delete();
					wait 0.2;
				}
				wait 0.05;
			}
		}
		wait 0.05;
	}
}

toggle_teleporter() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_teleporter = !( isdefined( self.toggle_teleporter ) && self.toggle_teleporter );

	if( level.toggle_teleporter == false ) {
        level.toggle_teleporter = true;
        self iprintlnsp( "^:Teleporter: ^7[^2On^7]" );
        self thread teleporter_save();
		self thread teleporter_load();
        wait 2.1;
		self iprintlnsp( "^:Press ^1[{+actionslot 3}] ^:To Save / ^1[{+actionslot 4}] ^:To Load!", 15 );
	}
	else {
        self notify( "endTeleporter" );
        level.toggle_teleporter = false;
        self iprintlnsp( "^:Teleporter: ^7[^1Off^7]" );
	}
}

teleporter_save()
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endTeleporter" );
	self.allow_teleport = 0;
	self notifyOnPlayerCommand( "teleport_save", "+actionslot 3" );
	for(;;)
	{
        self waittill( "teleport_save" );
		self iprintlnsp("^:Current Position Saved!");
		self.saved_origin = self.origin;
		self.saved_angles = self.angles;
		self.allow_teleport = 1;
	}
}

teleporter_load()
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endTeleporter" );
    self notifyOnPlayerCommand( "teleport_load", "+actionslot 4" );
	for(;;)
	{
		self waittill( "teleport_load" );
		if( self.allow_teleport == 1 )
		{
			self iprintlnsp( "^:Teleported To Saved Position!" );
			self setOrigin( self.saved_origin );
			self setPlayerAngles( self.saved_angles );
			self freezeControls( true );
			wait 0.1;
			self freezeControls( false );
		}
	}
}

toggle_no_spread() {
    self.toggle_no_spread = !( isdefined( self.toggle_no_spread ) && self.toggle_no_spread );

	if( level.toggle_no_spread == false ) {
        if( level.toggle_all_perks == true ) {
            executeCommand( "perk_weapSpreadMultiplier 0.001" );
        }
        else {
            level.player giveperk( "specialty_bulletaccuracy", false );
            executeCommand( "perk_weapSpreadMultiplier 0.001" );
        }
        level.toggle_no_spread = true;
        self iprintlnsp( "^:No Spread: ^7[^2On^7]" );
	}
	else {
        if( level.toggle_all_perks == true ) {
            executeCommand( "perk_weapSpreadMultiplier 0.65" );
        }
        else {
            level.player _unsetperk( "specialty_bulletaccuracy", false );
            executeCommand( "perk_weapSpreadMultiplier 0.65" );
        }
        level.toggle_no_spread = false;
        self iprintlnsp( "^:No Spread: ^7[^1Off^7]" );
	}
}

toggle_rapid_fire() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_rapid_fire = !( isdefined( self.toggle_rapid_fire ) && self.toggle_rapid_fire );

    if( level.inf_ammo == true ) {
        inf_ammo();
    }

	if( level.toggle_rapid_fire == false ) {
        if( level.toggle_all_perks == true ) {
            executeCommand( "perk_weapReloadMultiplier 0.001" );
        }
        else {
            level.player giveperk( "specialty_fastreload", false );
            executeCommand( "perk_weapReloadMultiplier 0.001" );
        }
        level.player thread monitor_rapid_fire();
        level.toggle_rapid_fire = true;
        self iprintlnsp( "^:Rapid Fire: ^7[^2On^7]" );
	}
	else {
        if( level.toggle_all_perks == true ) {
            executeCommand( "perk_weapReloadMultiplier 0.65" );
        }
        else {
            level.player _unsetperk( "specialty_fastreload", false );
            executeCommand( "perk_weapReloadMultiplier 0.65" );
        }
        self notify( "endRapidFire" );
        level.toggle_rapid_fire = false;
        self iprintlnsp( "^:Rapid Fire: ^7[^1Off^7]" );
	}
}

monitor_rapid_fire() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "endRapidFire" );
    for(;;) {
        self waittill( "weapon_fired" );
        currentWeapon = self GetCurrentWeapon();
		self setWeaponAmmoStock( currentWeapon, 999 );
		wait 0.05;
    }
}

set_vulnerable() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ai_array = getaiarray();
    foreach( ai in ai_array ) {
        ai.allowdeath = 1;
        ai invulnerable( 0 );
    }
    self iprintlnsp( "^:AI Invulnerability Disabled!" );
}

set_team( ai, new_team ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ai_array = getaiarray( ai );
    foreach( ai in ai_array ) {
        ai.team = new_team;
    }
    self iprintlnsp( "^:AI Team Changed: ^1" + ai + " ^:-> ^1" + new_team );
}

set_team_all( new_team ) {
    self endon( "game_ended" );
    self endon( "disconnect" );
    ai_array = getaiarray();
    foreach( ai in ai_array ) {
        ai.team = new_team;
    }
    self iprintlnsp( "^:AI Team Changed: ^1All ^:-> ^1" + new_team );
}

set_team_swap() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    allies_array = getaiarray( "allies" );
    axis_array = getaiarray( "axis" );
    foreach( ally in allies_array ) {
        ally.team = "axis";
    }
    foreach( axis in axis_array ) {
        axis.team = "allies";
    }
    self iprintlnsp( "^:AI Teams Swapped!" );
}

player_team( team ) {
    level.player.team = team;
}

toggle_axis_ignore() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_axis_ignore = !( isdefined( self.toggle_axis_ignore ) && self.toggle_axis_ignore );

	if( level.toggle_axis_ignore == false ) {
        self endon( "endAxisIgnore" );
        level.toggle_axis_ignore = true;
        self iprintlnsp( "^:Axis Ignore All: ^7[^2On^7]" );
        for(;;) {
            ai_array = getaiarray( "axis" );
            foreach( ai in ai_array ) {
                if( ai.ignoreall == undefined ) {
                    ai.ignoreall = 1;
                }
            }
            wait 1;
        }
	}
	else {
        ai_array = getaiarray( "axis" );
        foreach( ai in ai_array ) {
            ai.ignoreall = 0;
        }
        level.toggle_axis_ignore = false;
        self iprintlnsp( "^:Axis Ignore All: ^7[^1Off^7]" );
        self notify( "endAxisIgnore" );
	}
}

toggle_allies_ignore() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_allies_ignore = !( isdefined( self.toggle_allies_ignore ) && self.toggle_allies_ignore );

	if( level.toggle_allies_ignore == false ) {
        self endon( "endAlliesIgnore" );
        level.toggle_allies_ignore = true;
        self iprintlnsp( "^:Allies Ignore All: ^7[^2On^7]" );
        for(;;) {
            ai_array = getaiarray( "allies" );
            foreach( ai in ai_array ) {
                if( ai.ignoreall == undefined ) {
                    ai.ignoreall = 1;
                }
            }
            wait 1;
        }
	}
	else {
        ai_array = getaiarray( "allies" );
        foreach( ai in ai_array ) {
            ai.ignoreall = 0;
        }
        level.toggle_allies_ignore = false;
        self iprintlnsp( "^:Allies Ignore All: ^7[^1Off^7]" );
        self notify( "endAlliesIgnore" );
	}
}

toggle_axis_accuracy() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_axis_accuracy = !( isdefined( self.toggle_axis_accuracy ) && self.toggle_axis_accuracy );

	if( level.toggle_axis_accuracy == false ) {
        self endon( "endAxisAccuracy" );
        level.toggle_axis_accuracy = true;
        self iprintlnsp( "^:Accurate Enemies: ^7[^2On^7]" );
        for(;;) {
            ai_array = getaiarray( "axis" );
            foreach( ai in ai_array ) {
                if( ai.baseaccuracy != 999 ) {
                    ai.script_accuracy = 999;
                    ai.baseaccuracy = 999;
                }
            }
            wait 1;
        }
	}
	else {
        ai_array = getaiarray( "axis" );
        foreach( ai in ai_array ) {
            ai.script_accuracy = 1.05;
            ai.baseaccuracy = 1.05;
        }
        level.toggle_axis_accuracy = false;
        self iprintlnsp( "^:Accurate Enemies: ^7[^1Off^7]" );
        self notify( "endAxisAccuracy" );
	}
}

toggle_allies_accuracy() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_allies_accuracy = !( isdefined( self.toggle_allies_accuracy ) && self.toggle_allies_accuracy );

	if( level.toggle_allies_accuracy == false ) {
        self endon( "endAlliesAccuracy" );
        level.toggle_allies_accuracy = true;
        self iprintlnsp( "^:Accurate Allies: ^7[^2On^7]" );
        for(;;) {
            ai_array = getaiarray( "allies" );
            foreach( ai in ai_array ) {
                if( ai.baseaccuracy != 999 ) {
                    ai.script_accuracy = 999;
                    ai.baseaccuracy = 999;
                }
            }
            wait 1;
        }
	}
	else {
        ai_array = getaiarray( "allies" );
        foreach( ai in ai_array ) {
            ai.script_accuracy = 1.05;
            ai.baseaccuracy = 1.05;
        }
        level.toggle_allies_accuracy = false;
        self iprintlnsp( "^:Accurate Allies: ^7[^1Off^7]" );
        self notify( "endAlliesAccuracy" );
	}
}

toggle_axis_elites() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_axis_elites = !( isdefined( self.toggle_axis_elites ) && self.toggle_axis_elites );

	if( level.toggle_axis_elites == false ) {
        self endon( "endEliteAxis" );
        level.toggle_axis_elites = true;
        self iprintlnsp( "^:Elite Axis: ^7[^2On^7]" );
        for(;;) {
            ai_array = getaiarray( "axis" );
            foreach( ai in ai_array ) {
                if( ai.elite == undefined ) {
                    ai maps\_spawner::subclass_elite();
                }
            }
            wait 1;
        }
	}
	else {
        ai_array = getaiarray( "axis" );
        foreach( ai in ai_array ) {
            ai.script_accuracy = 1.05;
            ai.baseaccuracy = 1.05;
            ai.elite = undefined;
            ai.aggressivemode = undefined;
            ai laseroff();
        }
        level.toggle_axis_elites = false;
        self iprintlnsp( "^:Elite Axis: ^7[^1Off^7]" );
        self notify( "endEliteAxis" );
	}
}

toggle_allies_elites() {
    self endon( "game_ended" );
    self endon( "disconnect" );
    self.toggle_allies_elites = !( isdefined( self.toggle_allies_elites ) && self.toggle_allies_elites );

	if( level.toggle_allies_elites == false ) {
        self endon( "endEliteAllies" );
        level.toggle_allies_elites = true;
        self iprintlnsp( "^:Elite Allies: ^7[^2On^7]" );
        for(;;) {
            ai_array = getaiarray( "allies" );
            foreach( ai in ai_array ) {
                if( ai.elite == undefined ) {
                    ai maps\_spawner::subclass_elite();
                }
            }
            wait 1;
        }
	}
	else {
        ai_array = getaiarray( "allies" );
        foreach( ai in ai_array ) {
            ai.script_accuracy = 1.05;
            ai.baseaccuracy = 1.05;
            ai.elite = undefined;
            ai.aggressivemode = undefined;
            ai laseroff();
        }
        level.toggle_allies_elites = false;
        self iprintlnsp( "^:Elite Allies: ^7[^1Off^7]" );
        self notify( "endEliteAllies" );
	}
}

spawn_bot( bot_team )
{
    self endon( "game_ended" );
    self endon( "disconnect" );
    if( level.max_ai_set == false ) {
        level.maxai = 999;
        level.maxfriendlies = 999;
        level.max_ai_set = true;
    }
	spawner_array = GetSpawnerArray();
	wait 0.2;
	number = randomInt(spawner_array.size);
	pos_original = spawner_array[number].origin;
	spawner_array[number].origin = level.player aim()[ "position" ];
	spawner_array[number].script_forcespawn = true;
    spawner_array[number].script_startrunning = true;
    spawner_array[number].script_difficulty = "hard";
    spawner_array[number].script_team = bot_team;
    spawner_array[number].script_threatbiasgroup = bot_team;
    spawner_array[number].script_bcdialog = bot_team;
    spawner_array[number].script_health = undefined;
    spawner_array[number].script_startinghealth = undefined;
    spawner_array[number].script_dontshootwhilemoving = undefined;
    spawner_array[number].script_laser = undefined;
    spawner_array[number].script_accuracy = undefined;
    spawner_array[number].script_attackeraccuracy = undefined;
    spawner_array[number].script_sightrange = undefined;
    spawner_array[number].script_fightdist = undefined;
    spawner_array[number].script_maxdist = undefined;
    spawner_array[number].script_faceenemydist = undefined;
    spawner_array[number].script_flashbangs = undefined;
    spawner_array[number].script_nodrop = undefined;
    spawner_array[number].script_combatmode = undefined;
    spawner_array[number].script_combatbehavior = undefined;
    spawner_array[number].script_playerseek = undefined;
	spawner_array[number].script_pacifist = undefined;
	spawner_array[number].script_ignoreme = undefined;
	spawner_array[number].script_moveoverride = undefined;
	spawner_array[number].script_patroller = undefined;
	spawner_array[number].script_stealth = undefined;
    spawner_array[number].script_deathflag = undefined;
    spawner_array[number].script_deathtime = undefined;
    spawner_array[number].script_nosurprise = undefined;
    spawner_array[number].script_nobloodpool = undefined;
    spawner_array[number].script_danger_react = undefined;
    spawner_array[number].script_forcecolor = undefined;
    spawner_array[number].dontdropweapon = undefined;
    spawner_array[number].script_fixednode = undefined;
    spawner_array[number].script_noteworthy = undefined;
    spawner_array[number].script_goalvolume = undefined;
    spawner_array[number].script_ignore_suppression = undefined;
    spawner_array[number].script_ignoreall = undefined;
    spawner_array[number].script_favoriteenemy = undefined;
    spawner_array[number].script_longdeath = undefined;
    spawner_array[number].script_deathflag_longdeath = undefined;
    spawner_array[number].script_diequietly = undefined;
	spawner_array[number].count = 9999;
	bot = spawner_array[number] stalingradspawn();
	bot.team = bot_team;
    //bot maps\_spawner::subclass_elite();
	wait 0.2;
	spawner_array[number].origin = pos_original;
}