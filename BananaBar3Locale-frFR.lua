local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("BananaBar3", "frFR", false);

if not L then return end


-- all the lines starting with - should not be translated, 
-- these lines are just descriptions for translators

-- all texts where the textid ends with "desc" are 
-- long descriptions for the menu entry shown in the help and in the tooltip

L.showunmarkeddesc             = "Afficher et masquer les boutons";	

L.unmarked                     = "Sans marque";

-- Short name of the Addon, should normally not be translated
L.addonname                       = "BananaBar"; 

-- Long name of the Addon, the word BananaBar3 should normally not be translated, 
-- the appendix "Raid Symbols" can be translated
L.addonnamelong                   = "BananaBar Symboles de Raid";


L.showdebugmessages = "Afficher les messages de debogage";

L.showdebugmessagesdesc = "Show debug messages, usefur for development only";

-- Texts in the WOW Key binding Dialog
-- Text should not exceed one line to be correctly displayed in the dialog

-- A key to hold down, then moving over a group of mobs to set raid symbols on them 
L.binding_mouseover               = "Touche à maintenir enfoncée pour le ciblage mouseover";

-- When this key is pressed, raid symbols are set to all mobs that 
-- are targeted by any player in the raid. Which symbols on which mobs (*) can be configured 
-- in the mobsettings menu ( * Symbol to mob assignment can be configured. )
L.binding_key                     = "Touche pour définir les symboles sur les mobs accessibles";

-- when this key is held down, the mouse cursor changes it's icon to the icon of the 
-- mob you are hoovering. This can be used to find a specific mob in a group or check the 
-- symbol of the mob you are searching for 
L.binding_search                  = "Rechercher un symbole avec la souris";


L.autosetcombat                  = "Définir automatiquement des symboles sur les mobs lors d'un combat";
L.autosetcombatdesc              = "Définir automatiquement des symboles sur les mobs lors d'un combat";

L.buttonorder					 = "Ordre des symboles automatiques";
L.buttonorderdesc 				 = "Modifier l'ordre des symboles pour les symboles définis automatiquement";

L.symbol_order_combat			 = "ordre des symboles en combat";
L.symbol_order_combat_desc		 = "Définir par raccourci clavier l'ordre des symboles automatiques ";
L.symbol_order_hotkey			 = "Touche de raccourci pour l'ordre des symboles";
L.symbol_order_hotkey_desc		 = "Set symbol order for autoset symbols by hotkey";
L.symbol_order_mouse			 = "Définir l'ordre des symboles pour les symboles auto defini par raccourci";
L.symbol_order_mouse_desc		 = "Définir l'ordre des symboles pour le survol de la souris";
L.order_symbols_desc		     = "1er symbole utilisé, changez l'ordre ici";

-- the submenu where you can find all the settings corresponding to all visual effects
-- of bananabar. For example "Hide buttons"; "button size"; "show button frames" etc.
L.design                          = "Paramètres visibles";
L.designdesc                      = "Paramètres visibles";

-- hide buttons that are currently not used (no mob has this target)
-- buttons will also be hidden if no party member has targeted the mob 
-- with the specific symbol
L.hideunused                      = "Masquer les boutons inutilisés";
L.hideunuseddesc                  = "Masquer les boutons qui ne sont pas utilisés pour le moment";

-- hide the black frame around the button
L.hidebuttonframes                = "Masquer les cadres des boutons";
L.hidebuttonframesdesc            = "Switch de visiblité des cadres des boutons";


-- mark dead targets with an overlay image over the button        
L.markdead                        = "Marquer les cibles mortes";
L.markdeaddesc                    = "Marquer les cibles mortes avec un symbole superposé";


-- submenu where you can enable/disable single buttons
L.showbutton                      = "Afficher le bouton pour..."; 

-- description used for normal buttons and also for the parent menu "Show buttons for"
L.showbuttondesc                  = "Afficher / masquer les boutons uniques"; 

-- used for huntersmark buttons
L.showhuntersmarkdesc             = "Afficher le bouton de la marque du Chasseur"; 

-- Translations for the button names
-- use RAID_TARGET_1 and so on for the original blizzard names
-- in our guild we use the name "Condom" for the orange circle
L.symbolname1                     = RAID_TARGET_1;
L.symbolname2                     = "Pastille orange";
L.symbolname3                     = RAID_TARGET_3;
L.symbolname4                     = RAID_TARGET_4;
L.symbolname5                     = RAID_TARGET_5;
L.symbolname6                     = RAID_TARGET_6;
L.symbolname7                     = RAID_TARGET_7;
L.symbolname8                     = RAID_TARGET_8;
-- Symbol name for the huntersmark
L.huntersmark                     = "Marque du chasseur";

-- menu entry to activate the layout mode
-- in the layoutmode you can move, seperate and concatenate buttons        
L.layoutmode                      = "Modifier les cadres";
L.layoutmodedesc                  = "Active le mode Modification des cadres.Utilisez-le pour déplacer et regrouper les boutons";

-- Show count if zero
L.showzerotarget				  = "Masquer le compteur quand = Zéro";
L.showzerotargetdesc			  = "Masquer le compteur quand aucun joueur cible la cible";

-- scale the normal BananaBar3 button size
L.scale                           = "échelle"; 
L.scaledesc                       = "Échelle des boutons de 10% à 200%"; 
L.shiftX						  = "Décalage X du compteur";
L.shiftY						  = "Décalage Y du compteur";
L.shiftXdesc					  = "Décalage X du compteur";
L.shiftYdesc					  = "Décalage Y du compteur";

-- scale the 40 buttons of the raid overview panel
L.scaleassist                     = "Boutons de modification de l'échelle"; 
L.scaleassistdesc                 = "Boutons de modification de l'échelle 10% to 200%"; 

-- reset everything to the defaults, except the settings in the submenu "mobsettings"        
L.reset                           = "Réinitialiser"; 
L.resetdesc                       = "Réinitialiser tous les paramètres du profil actuel"; 

-- this message comes up if BananaBar3 has detected that you have installed a newer version 
-- of BananaBar which is not compatible with the old one and the profile is resetted to defaults
L.oldprofilemessage               = "TLes paramètres du profil chargé proviennent d'un ancien BananaBar3  "..
			  "version, les paramètres sont réinitialisés à leurs valeurs par défaut";

-- name for the /bb2config console command
L.config                          = "Configuration"; 
L.configdesc                      = "Ouvre le menu popup de configuration"; 


-- name for the config menu entry in the mouse button settings menu
L.action_config                   = "Ouvre le popup de configuration";
L.action_configdesc               = "Ouvre le menu popup de configuration";

-- name for the "Target mob by symbol" menu entry in the mouse button settings menu
-- this still exists in the menu, but is no longer supported in WoW 2.0
L.action_target                   = "Pose le symbole sur le mob";
L.action_targetdesc               = "Pose le symbole sur le mob";

-- name for the config menu entry in the mouse button settings menu
L.action_setsymbol                = "Définir le symbole de raid ou la marque du chasseur";
L.action_setsymboldesc            = "Définir le symbole de raid ou la marque du chasseur sur la cible actuelle";

-- name for the config menu entry in the mouse button settings menu
L.action_setTargetsymbol                = "Cible le Mob du Symbole (focus)";
L.action_setTargetsymboldesc            = "Cible le Mob porteur du Symbole";

-- setting in the mobsettings menu, if activated this mob will get a symbol
-- if you press the autosymbols key (binding_key)
L.autosymbolsbyhotkey             = "Activer les symboles automatiques par raccourci clavier";
L.autosymbolsbyhotkeydesc         = "Si activé, vous pouvez définir des symboles automatiquement sur les mobs en appuyant sur la touche de raccourci spécifique";

-- setting in the mobsettings menu, if activated for a mob, this mob gets a symbol 
-- whenever it enters combat with your group and anyone of the group has targeted it
L.autosymbolsoncombat             = "Activer les symboles automatiques lors de l'entrée en combat";
L.autosymbolsoncombatdesc         = "Si activé : les symboles sont définis sur ce mob lorsqu'il entre en combat avec votre raid";

-- if activated this mob will be SKIPPED for mouse over targeting        
L.autosymbolsonmouseover          = "Désactiver la pose des symboles automatiques au survol de la souris";
L.autosymbolsonmouseoverdesc      = "Désactiver la pose des symboles au survol de la souris";

-- description for the menu entrys for the specific mobs in the mobsettings menu          
L.autosymboldesc                  = "Si coché, ce symbole est utilisé pour les symboles automatiques et les symboles automatiques au combat,"..
			 "Le ciblage par survol utilise toujours tous les symboles";


L.hidebuttonbackdesc			  = "Masquer ou afficher les arrière-plans des boutons";
L.hidebuttonback				  = "Masquer les arrière-plans des boutons";


-- shift key on the keyboard, used in mouse button settings        
L.shift                           = "SHIFT";
L.shiftdesc                       = "Touche Shift";
-- control key (ctrl) on the keyboard, used in mouse button settings        
L.control                         = "CTRL";
L.controldesc                     = "Touche CTRL";
-- alt key on the keyboard, used in mouse button settings        
L.alt                             = "ALT";
L.altdesc                         = "Touche Alt";

-- Left mousebutton        
L.leftmouse                       = "Bouton gauche de la souris";
L.leftmousedesc                   = "Bouton gauche de la souris";
-- Right mousebutton        
L.rightmouse                      = "Bouton droit de la souris";
L.rightmousedesc                  = "Bouton droit de la souris";
-- Middle mousebutton        
L.middlemouse                     = "Bouton central de la souris";
L.middlemousedesc                 = "Bouton central de la souris";
-- mousebutton 4
L.mouse4                          = "Bouton 4 de la souris";
L.mouse4desc                      = "Bouton 4 de la souris";
-- mousebutton 5
L.mouse5                          = "Bouton 5 de la souris";
L.mouse5desc                      = "Bouton 5 de la souris";

-- the update rate how often your raid will be scanned 
L.updaterate                      = "Changer la vitesse de mise à jour";
L.updateratedesc                  = "Modifier le temps de mise à jour en secondes, valeur inférieure "..
			  "Càd plus de mises à jour mais peut entraîner un décalage sur les ordinateurs très lents";

-- menu entry for the mob settings menu
L.mobsettings                     = "Modifier les paramètres spécifiques aux mob's";
L.mobsettingsdesc                 = "Modifier les paramètres pour les mobs spécifiques pour le réglage automatique des symboles";

-- menu entry for the mouse button settings menu
L.mousebutton                     = "Modifier les paramètres du bouton de la souris";
L.mousebuttondesc                 = "Changer ce qui se passe lorsque vous cliquez sur un bouton BananaBar";

-- The tooltip text that occurs over the buttons when in layout mode         
L.layoutmodetooltip               = "Layoutmode est activé.\n"..
			  "Utilisez le bouton gauche de la souris pour déplacer un bouton ou un groupe de boutons.\n"..
			  "Bouton droit de la souris pour déconnecter les boutons liés.\n"..
			  "Mouse5 pour déconnecter tous les liens\n"..
			  "Mouse4 ou échappe";
											
-- shows the BananaBar buttons when you are in a raid group
L.showinraid                      = "Afficher les boutons en raid";
L.showinraiddesc                  = "Afficher les boutons en groupe";
-- shows bananabar buttons when you are in a normal party 
L.showinparty                     = "Afficher les boutons en groupe";
L.showinpartydesc                 = "Afficher les boutons en groupe";
-- shows bananabar buttons when you are in a normal party 
L.showoutofgroup                  = "Afficher les boutons hors du groupe";
L.showoutofgroupdesc              = "Afficher les boutons lorsque vous n'êtes pas en groupe";

-- shows or hides the raid info panel (this panel is only shown when you are in a raid
L.showraidinfo                    = "Afficher le panneau Raidinfo en raid";
L.showraidinfodesc                = "Afficher le panneau Raidinfo en raid";

L.showraidinfoall                 = "Afficher le panneau Raidinfo lorsque vous n'est pas en raid";
L.showraidinfoalldesc             = "Afficher le panneau Raidinfo lorsque vous n'est pas en raid";


-- Shows mob name and health bar next to the raid symbol buttons
L.showextrainfo             		= "Afficher le nom du mob et sa barre de vie";
L.showextrainfodesc               = "Affiche le nom des mobs et la barre de vie à côté des boutons de symbole de raid";

