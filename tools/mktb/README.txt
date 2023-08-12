-- MARIO KART TOOLBOX --

[Credits]

Mario Kart Toolbox was made by Gericom, Ermelber and Szymbar.
Huge props to Yoshidude4 for his KCL ID research.
Special thanks to the MKDS Modding and Haroohie Pals Discord members.

[Changelog for 1.6.8.0]
- Added support for RankTimeGP.rtt editing (only for tracks already existing in RankTimeGP.rtt)
- CPU/Player models toggle in the Kart editor
- Fixed wrong Area rendering offset
- Better object database (with an object selector too)
- Renamed fields thanks to research (KartPhysicalParam and NKM)
- Improved rom folder saving for big ROMs
- Some experimental features such as Auto respawn generation
- Other fixes

[Changelong for 1.6.7.0]
- NKM Transform Tool: WARNING! This feature is experimental, be careful. You can now rotate and move all the coordinates of the currently open NKM in the course editor. (Tools -> NKM Transform).
- Global Map Coordinates rendering and editing in 2D View
- Major program crashing bug fixed: handling CPAT/EPAT/IPAT indices carelessly no longer causes many problems

[Changelong for 1.6.6.4]
- Fixed menu project button not showing up

[Changelong for 1.6.6.3]
- Projects and NDS Building: You can now create projects allowing you to unpack the whole rom (and also archives) into a folder and eventually building it to an NDS file
- File opening: You can now open nkproj/efeproj/xml/nds files by dragging them onto the executable (this also allows file association)
- Character & Kart Editor: KartAppear, KartMenuParam, KartPhysicalParam, CharMenuParam and CharPhysicalParam are now editable
- Course Editor: KartAIparam and StaffGhostTime are now editable
- Mission Editor: Mission NKM Editing, Mission List and editable settings by right clicking on the list entry
- Enhanced ROM FS Browser: You can now open archive files
- BMG Editor: You can add/remove/edit entries inside any BMG file you open from the ROM FS Browser and you can also preview the text using any of the 3 fonts available in the game
- Object Database: Various fixes and updated bundled XML File (Still needs work)
- Configuration: You can now change the default language displayed in message lists (Character/Kart/Course/Mission...)
- Other minor fixes

[Changelong for 1.6.5.5]
- Much faster LZ77 compression
- Improved kcl writing speed

[Changelong for 1.6.5.4]
- Area Editing (Cylindric Areas are still displayed as boxes)
- Toggle angle in 2D View
- Course Sound Effect Bank editing
- JSON Export for NKM

[Changelong for 1.6.5.3]
- Fixed Local Map viewing
- Added KCL node compression
- Other subtle fixes

[Changelong for 1.6.5.2]
- Local Map Editor (Not completely working)

[Changelong for 1.6.5.1 (Hotfix)]

- Fixed EPOI/IPOI copy function
- Fixed MEPO hiding/showing

[Changelong for 1.6.5.0]

- Visual Kart Offset Data editor (with 3D models), no need for TooLazyToKeepDoingItByHand anymore.
- X/Y/Z Axis movement lock (works better in XY mode for now) by pressing X, Y or Z.
- Added support for MKDS Obji Database (Editor isn't available yet). Object Settings can now assume different meanings based on the data inside this said database.
- MEPO doesn't have a Drifting Value anymore since that was wrongly labeled.
- Changed some Course Editor UI elements to make it less cluttered.
- Various other visual and functional fixes.

[Features from 1.6.4.0]

- You no longer need to entierly close out of the program to reload the ROM, or XML file you're editing, further more, you can click "file" top even open an entierly different ROM, or XML file altogether!
- Discord Rich Presence has been added! It can be enabled, or disabled in preferences in the "General" tab.
- You can now see the names that courses have on the in-game menus while selecting a course to edit, making it a bit faster to find what you're looking for.
- You can now customize the color of the points in the NKM Editor from preferences in the "Display" tab!
- You can now use the Auto-Y feature in 2D mode as well, by using the CTRL key while dragging a point like you would in 3D mode.
- You can now toggle which sections you're viewing while editing NKM in both 2D, and 3D mode by checking, or unchecking the options in the "show" drop down menu.
- CPOI a.k.a. checkpoints now have arrows on them showing you which way they go.
- KCL/collision generation has finally been added to MKTB! No more reason to use EFE to generate collision. It also comes with new KCL calculator functionality, so you no longer need to keep a KCL ID List on hand! It can also pull KCL IDs from the material names in your collision model, 
if you name them that way.
- You can even export the KCL/collision model as OBJ from MKTB, if you ever need, or want to.
- You can now toggle the viewing of point size on, and off while in 2D mode!
