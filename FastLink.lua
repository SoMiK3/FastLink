-- Author - https://vk.com/klamet1

require "lib.sampfuncs"
require "lib.moonloader"

script_name("FastLink")
script_author("�����")
script_version("3.0")
script_properties("work-in-pause")

local main_color = 0x5A90CE
local color_text = "{FFFF00}"
local tag = "[Fastlink]: "

local dlstatus = require('moonloader').download_status

local script_vers = 8
local script_vers_text = "3.0"
local script_path = thisScript().path
local script_url = "https://raw.githubusercontent.com/SoMiK3/FastLink/main/FastLink.lua"
local update_path = getWorkingDirectory() .. "/flinkupdate.ini"
local update_url = "https://raw.githubusercontent.com/SoMiK3/FastLink/main/flinkupdate.ini"
local config_path = getWorkingDirectory() .. "/config/flinke.ini"

local MoonFolder = getWorkingDirectory()
local MoonLibFolder = MoonFolder .. "\\lib"
local samplua_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events.lua"
local raknet_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/raknet.lua"
local utils_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/utils.lua"
local handlers_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/handlers.lua"
local extra_types_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/extra_types.lua"
local bitstream_io_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/bitstream_io.lua"
local core_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/core.lua"
local imgui_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/imgui.lua"
local imguidll_url = "https://github.com/SoMiK3/FastLinkLibs/blob/main/MoonImGui.dll?raw=true"
local fAwesome5_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/fAwesome5.lua"
local fa_solid_900_url = "https://github.com/SoMiK3/FastLinkLibs/blob/main/fa-solid-900.ttf?raw=true"
-- ��� ����������� BLASTHACK. ��� �������, ��� ������ �� ����� ����� �� ������, ��� ��� ����� ����������� �� �����. �� ���� ��-�� ����� ���������� ���� �� ��������� ������������, ���� �������� ��� ��� ������� ��������.
nalichie = true

function onScriptTerminate(script, quitGame)
	if script == thisScript() then
		sampShowDialog(1338, "{FFFF00}���� ������� {FFFFFF}FastLink", "{FFFF00}������ ��� {FFFFFF}������� {FFFF00}�� �����-�� �������...\n��������, ������ ��� {FFFFFF}������������{FFFF00}, ��� ����� ��������������� ��������� ������� ����\n\n���� �� ������ �� ��� ������������, ����������, ���������� ����: {FFFFFF}https://vk.com/klamet1/\n�� �������� �������{FFFF00}, ����� ���� ���� ��������� �������� ����� {FFFFFF}������{FFFF00} �������.\n\n\n{ffff00}� ���������... ������� �� ������������ � ���������, {FFFFFF}����� {FFFF00}��� � ������.\n{ff0033}������� ����� ������ �� ��������, ��������� �������������� ������ ����������� CTRL + R\n��������� �������������� ��� ���� ���������� �� ��������� � ��������� �� ����� �� ����������, ���� ������ �� ����������\n{FFFF00}�� ��� ������ ��������� {FFFFFF}����� {FFFF00}�� ������ :)\n���� {00FF00}�{FFFF00}���� � ��������, {FFFFFF}���", "{ff0000}����� ���", nil, DIALOG_STYLE_MSGBOX)
	end
end

if not doesDirectoryExist("moonloader//lib") then
	createDirectory("moonloader//lib")
end
if not doesDirectoryExist("moonloader//lib//samp") then
	createDirectory("moonloader//lib//samp")
end
if not doesDirectoryExist("moonloader//lib//samp//events") then
	createDirectory("moonloader//lib//samp//events")
end
if not doesDirectoryExist("moonloader//lib//resource") then
	createDirectory("moonloader//lib//resource")
end
if not doesDirectoryExist("moonloader//lib//resource//fonts") then
	createDirectory("moonloader//lib//resource//fonts")
end

if not doesFileExist(MoonLibFolder .."\\samp\\events.lua") then
	downloadUrlToFile(samplua_url, MoonLibFolder .."\\samp\\events.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\raknet.lua") then
	downloadUrlToFile(raknet_url, MoonLibFolder .."\\samp\\raknet.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\utils.lua") then
	downloadUrlToFile(utils_url, MoonLibFolder .."\\samp\\events\\utils.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\handlers.lua") then
	downloadUrlToFile(handlers_url, MoonLibFolder .."\\samp\\events\\handlers.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\extra_types.lua") then
	downloadUrlToFile(extra_types_url, MoonLibFolder .."\\samp\\events\\extra_types.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\bitstream_io.lua") then
	downloadUrlToFile(bitstream_io_url, MoonLibFolder .."\\samp\\events\\bitstream_io.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\core.lua") then
	downloadUrlToFile(core_url, MoonLibFolder .."\\samp\\events\\core.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\imgui.lua") then
	downloadUrlToFile(imgui_url, MoonLibFolder .."\\imgui.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\fAwesome5.lua") then
	downloadUrlToFile(fAwesome5_url, MoonLibFolder .."\\fAwesome5.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\resource\\fonts\\fa-solid-900.ttf") then
	downloadUrlToFile(fa_solid_900_url, MoonLibFolder .."\\resource\\fonts\\fa-solid-900.ttf")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\MoonImGui.dll") then
	downloadUrlToFile(imguidll_url, MoonLibFolder .."\\MoonImGui.dll")
	nalichie = false
end
if not nalichie then
	thisScript():reload()
end

local sampev = require "lib.samp.events"
local keys = require "vkeys"
local inicfg = require "inicfg"
local rkeys = require "rkeys"
local sw, sh = getScreenResolution()
local initable = {
cfg = {
	posx = 0,
	posy = sh / 2,
	cchat = true,
	cimgui = false,
	numberint = 1,
	checksound = true,
	tabIgnore = false,
	chatIgnore = false,
	dialogIgnore = false,
	consoleIgnore = false,
	bindKey = "[113]",
	color1 = 0.00,
	color2 = 0.49,
	color3 = 1.00,
	theme = 1
	}
}
local flinke
if not doesDirectoryExist("moonloader//lib") then
	createDirectory("moonloader//lib")
	inicfg.save(initable, "flinke")
end
flinke = inicfg.load(nil, "flinke")
if flinke == nil then
	inicfg.save(initable, "flinke")
	flinke = inicfg.load(nil, "flinke")
end
if flinke.cfg.cchat then
	numberint = 1
elseif flinke.cfg.cimgui then
	numberint = 2
end
if flinke.cfg.checksound then
	check = true
else
	check = false
end
a1 = flinke.cfg.color1
b1 = flinke.cfg.color2
c1 = flinke.cfg.color3
theme = flinke.cfg.theme
local imgui = require "imgui"
local encoding = require "encoding"
encoding.default = "CP1251"
u8 = encoding.UTF8

local menuSelected = 1

local main_window = imgui.ImBool(false)
local two_window = imgui.ImBool(false)
local local_text = imgui.ImBuffer(50)
local global_text = imgui.ImBuffer(50)
local check_sound = imgui.ImBool(check)
local check_tab = imgui.ImBool(flinke.cfg.tabIgnore)
local check_chat = imgui.ImBool(flinke.cfg.chatIgnore)
local check_dialog = imgui.ImBool(flinke.cfg.dialogIgnore)
local check_console = imgui.ImBool(flinke.cfg.consoleIgnore)
local radio = imgui.ImInt(numberint)
local color = imgui.ImFloat3(a1, b1, c1)
imgui.HotKey = require("imgui_addons").HotKey
local activeKeys = {
	v = decodeJson(flinke.cfg.bindKey)
}
local tLastKeys = {}

local fa_font = nil
local fa = require 'fAwesome5'
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })

local page = 1

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end

	sampRegisterChatCommand("flink", golink)
	sampRegisterChatCommand("flinkwork", work)
	sampRegisterChatCommand("flinkinfo", info)
	sampRegisterChatCommand("flinkupd", upd)
	sampRegisterChatCommand("flinkupdinfo", updinfo)
	sampRegisterChatCommand("flinkupdcheck", updcheck)
	sampRegisterChatCommand("flinkupdhistory", history)
	sampRegisterChatCommand("flinkmn", mn)

	work = true
	abobus = false
	naideno = false
	mbobnova = false
	obnova = false
	checkupd = false
	changepos = false
	linkDeleted = false
	timer = false

		l = {
'aero',
'arpa',
'asia',
'biz',
'cat',
'com',
'co',
'coop',
'edu',
'gov',
'info',
'int',
'jobs',
'mil',
'mobi',
'museum',
'name',
'net',
'org',
'site',
'online',
'market',
'gmail',
'sex',
'post',
'pro',
'tel',
'travel',
'xxx',
'ac',
'ad',
'af',
'ag',
'ai',
'al',
'an',
'ao',
'aq',
'at',
'au',
'aw',
'ax',
'az',
'ba',
'bb',
'bd',
'be',
'bf',
'bg',
'bh',
'bj',
'bl',
'bm',
'bn',
'bo',
'bq',
'br',
'bs',
'bt',
'bv',
'bw',
'by',
'bz',
'cc',
'cd',
'cf',
'cg',
'ch',
'ci',
'ck',
'cl',
'cm',
'cn',
'cr',
'cu',
'cv',
'cw',
'cx',
'cy',
'cz',
'dj',
'dk',
'dm',
'do',
'dz',
'ec',
'ee',
'eg',
'eh',
'er',
'es',
'et',
'eu',
'fi',
'fj',
'fk',
'fm',
'fo',
'fr',
'ga',
'gb',
'gd',
'ge',
'gf',
'gg',
'gh',
'gi',
'gl',
'gm',
'gn',
'gp',
'gq',
'gr',
'gs',
'gt',
'gu',
'gw',
'gy',
'hk',
'hm',
'hn',
'hr',
'hu',
'id',
'ie',
'il',
'im',
'io',
'iq',
'ir',
'is',
'it',
'je',
'jm',
'jp',
'ke',
'kg',
'kh',
'ki',
'km',
'kn',
'kp',
'kr',
'kw',
'ky',
'kz',
'la',
'lb',
'lc',
'li',
'lk',
'lr',
'ls',
'lt',
'lu',
'lv',
'ly',
'ma',
'mc',
'md',
'me',
'mf',
'mg',
'mh',
'mk',
'ml',
'mm',
'mn',
'mp',
'mq',
'mr',
'ms',
'mt',
'mv',
'mw',
'mx',
'my',
'mz',
'nc',
'nf',
'ng',
'ni',
'nl',
'no',
'np',
'nr',
'nu',
'nz',
'om',
'pa',
'pe',
'pf',
'pg',
'ph',
'pk',
'pl',
'pm',
'pn',
'ps',
'pt',
'pw',
'py',
'qa',
'ro',
'rs',
'ru',
'rw',
'sa',
'sb',
'sc',
'sd',
'se',
'sg',
'sh',
'si',
'sj',
'sk',
'sl',
'sm',
'sn',
'so',
'sr',
'ss',
'st',
'su',
'sv',
'sx',
'sy',
'sz',
'tc',
'td',
'tf',
'tg',
'th',
'tj',
'tk',
'tl',
'tm',
'tn',
'tp',
'tt',
'tv',
'tw',
'tz',
'ua',
'ug',
'uk',
'um',
'us',
'uy',
'uz',
'va',
'vc',
've',
'vg',
'vi',
'vn',
'vu',
'wf',
'ws',
'ye',
'yt',
'za',
'zm',
'zw',
'xyz',
'ooo',
'porn',
'red',
'dev',
'google',
'yandex',
'microsoft',
'amazon'
}

		ln = {
}

	sampAddChatMessage(tag .. color_text .. "������ ����� � ������. ����� - " .. "{FFFFFF}" ..  "�����" .. color_text .. "! ����������: " .. "{FFFFFF}" .. "/flinkinfo", main_color)
	sampAddChatMessage(tag .. color_text .. "�������� ������ ��� ����� ������ �� {FFFFFF}ARZ RP(G) {FFFF00}�� ����� �� ������: {FFFFFF}https://www.blast.hk/threads/98205/", main_color)
	sampAddChatMessage(tag .. color_text .. "��� �������� �� ������ {FFFFFF}https://www.blast.hk/threads/98245/{FFFF00} ������� {FFFFFF}F3", main_color)

	bindKey = rkeys.registerHotKey(activeKeys.v, 1, true, callbackFunc)

	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	if file == nil then
		io.open(MoonFolder .."\\config\\llinks.json", "a")
	end
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	local tabl = decodeJson(a)
	if tabl == nil then
		tabl = {
			locall = {
			},
			globall = { 
			}
		}
	end
	encodedTable = encodeJson(tabl)
	local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
	file:write(encodedTable)
	file:flush()
	file:close()

	downloadUrlToFile(update_url, update_path, function(id, status)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			checkupd = true
			updateIni = inicfg.load(nil, update_path)
			if tonumber(updateIni.info.vers) > script_vers then
				sampAddChatMessage(tag .. color_text .. "���� {FFFFFF}����������{FFFF00}! ����� ������: {FFFFFF}" .. updateIni.info.vers_text .."{FFFF00}. ������� ������: {FFFFFF}".. script_vers_text .. "{FFFF00}.", main_color)
				sampAddChatMessage(tag .. color_text .. "������ ��������� ����� � ������ ������� �� {FFFFFF}���������{FFFF00}. ������� ��� ��������: {FFFFFF}/flinkupdinfo", main_color)
				sampAddChatMessage(tag .. color_text .. "����� {FFFFFF}����������{FFFF00} ����������, ���������� ������ {FFFFFF}/flinkupd", main_color)
				mbobnova = true
				checkupd = false
			else
				checkupd = false
				sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�� �������{FFFF00}. ��������� ������� ���������� �������� ����� ����� {FFFFFF}/flinkupdcheck", main_color)
			end
			os.remove(update_path)
			checkupd = false
		end
	end)

	lua_thread.create(function()
		while true do
			wait(0)
			if #ln > 0 then
				if not example then
					vivodssilka = ln[1]
					mojnavivod = true
					two_window.v = true
					if flinke.cfg.checksound then
						addOneOffSound(0.0, 0.0, 0.0, 1137)
						wait(100)
						addOneOffSound(0.0, 0.0, 0.0, 1138)
						wait(100)
						addOneOffSound(0.0, 0.0, 0.0, 1139)
					end
					wait(5000)
					table.remove(ln, 1)
					mojnavivod = false
					newssilka = false
					wait(200)
				end
			end
		end
	end)

	while true do
	wait(0)
		if callbackAct then
			callbackAct = false
			if not isPauseMenuActive() and not main_window.v and work == true then
				if flinke.cfg.chatIgnore or flinke.cfg.tabIgnore or flinke.cfg.consoleIgnore or flinke.cfg.dialogIgnore then
					if flinke.cfg.chatIgnore then
						if not sampIsChatInputActive() then
							if flinke.cfg.tabIgnore then
								if not sampIsScoreboardOpen() then
									if flinke.cfg.consoleIgnore then
										if not isSampfuncsConsoleActive() then
											if flinke.cfg.dialogIgnore then
												if not sampIsDialogActive() then
													if abobus then
														sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
														os.execute("start " .. ssilka)
													elseif changepos then
														sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
													else
														sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
													end
												end
											else
												if abobus then
													sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
													os.execute("start " .. ssilka)
												elseif changepos then
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
												else
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
												end
											end
										end
									else
										if flinke.cfg.dialogIgnore then
											if not sampIsDialogActive() then
												if abobus then
													sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
													os.execute("start " .. ssilka)
												elseif changepos then
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
												else
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
												end
											end
										else
											if abobus then
												sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
												os.execute("start " .. ssilka)
											elseif changepos then
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
											else
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
											end
										end
									end
								end
							else
								if flinke.cfg.consoleIgnore then
									if not isSampfuncsConsoleActive() then
										if flinke.cfg.dialogIgnore then
											if not sampIsDialogActive() then
												if abobus then
													sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
													os.execute("start " .. ssilka)
												elseif changepos then
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
												else
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
												end
											end
										else
											if abobus then
												sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
												os.execute("start " .. ssilka)
											elseif changepos then
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
											else
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
											end
										end
									end
								else
									if flinke.cfg.dialogIgnore then
										if not sampIsDialogActive() then
											if abobus then
												sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
												os.execute("start " .. ssilka)
											elseif changepos then
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
											else
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
											end
										end
									end
								end
							end
						end
					else
						if flinke.cfg.tabIgnore then
							if not sampIsScoreboardOpen() then
								if flinke.cfg.consoleIgnore then
									if not isSampfuncsConsoleActive() then
										if flinke.cfg.dialogIgnore then
											if not sampIsDialogActive() then
												if abobus then
													sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
													os.execute("start " .. ssilka)
												elseif changepos then
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
												else
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
												end
											end
										else
											if not sampIsDialogActive() then
												if abobus then
													sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
													os.execute("start " .. ssilka)
												elseif changepos then
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
												else
													sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
												end
											end
										end
									end
								else
									if flinke.cfg.dialogIgnore then
										if not sampIsDialogActive() then
											if abobus then
												sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
												os.execute("start " .. ssilka)
											elseif changepos then
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
											else
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
											end
										end
									end
								end
							end
						else
							if flinke.cfg.consoleIgnore then
								if not isSampfuncsConsoleActive() then
									if flinke.cfg.dialogIgnore then
										if not sampIsDialogActive() then
											if abobus then
												sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
												os.execute("start " .. ssilka)
											elseif changepos then
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
											else
												sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
											end
										end
									else
										if abobus then
											sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
											os.execute("start " .. ssilka)
										elseif changepos then
											sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
										else
											sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
										end
									end
								end
							else
								if flinke.cfg.dialogIgnore then
									if not sampIsDialogActive() then
										if abobus then
											sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
											os.execute("start " .. ssilka)
										elseif changepos then
											sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
										else
											sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
										end
									end
								end
							end
						end
					end
				else
					if abobus then
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
						os.execute("start " .. ssilka)
					elseif changepos then
						sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
					else
						sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
					end
				end
			end
		end
		if isKeyJustPressed(0x72) and not isPauseMenuActive() and work == true then
			if changepos then
				sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}����������[FFFF00}.", main_color)
			else
				sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ������...", main_color)
				os.execute("start https://www.blast.hk/threads/98245/")
			end
		end
		if obnova then
			downloadUrlToFile(script_url, script_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�������{FFFF00} �����������. ����� ������: {FFFFFF}" .. updateIni.info.vers_text, main_color)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}������{FFFF00} ������� ���������� �����, ����� {FFFFFF}/flinkupdhistory", main_color)
					sampAddChatMessage(tag .. color_text .. "������ ��� ������������� {FFFFFF}������� {FFFF00}�� ��������� �� ���������", main_color)
					os.remove(config_path)
				end
			end)
			break
		end
		if changepos or main_window.v then
			imgui.ShowCursor = true
		else
			imgui.ShowCursor = false
		end
		if main_window.v or two_window.v then
			imgui.Process = true
		else
			imgui.Process = true
		end
		if flinke.cfg.bindKey:match("%[%d+%]") then
			showKey = flinke.cfg.bindKey:match("%[(%d+)%]")
			showKey = tonumber(showKey)
			oneKey = true
			double = false
			triple = false
		elseif flinke.cfg.bindKey:match("%[%d+,%d+%]") then
			showKey1, showKey2 = flinke.cfg.bindKey:match("%[(%d+),(%d+)%]")
			showKey1 = tonumber(showKey1)
			showKey2 = tonumber(showKey2)
			oneKey = false
			double = true
			triple = false
		elseif flinke.cfg.bindKey:match("%[%d+,%d+,%d+%]") then
			showKey1, showKey2, showKey3 = flinke.cfg.bindKey:match("%[(%d+),(%d+),(%d+)%]")
			showKey1 = tonumber(showKey1)
			showKey2 = tonumber(showKey2)
			showKey3 = tonumber(showKey3)
			oneKey = false
			double = false
			triple = true
		end
		if windowActive then
			local result, button, list, input = sampHasDialogRespond(1337)
			if result then
				if button == 0 then
					main_window.v = true
					windowActive = false
				else
					main_window.v = true
					windowActive = false
				end
			end
		end
	end
end

function callbackFunc()
	callbackAct = true
end

function golink()
	if work then
		if abobus then
			sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
			os.execute("start " .. ssilka)
		else
			sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
		end
	else
		sampAddChatMessage(tag .. color_text .. "������ ��� {FFFFFF}��������{FFFF00}. ��� ��������� ���� ������ ������� {FFFFFF}/flinkwork", main_color)
	end
end

function work()
	if work then
		sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}��������", main_color)
		work = false
	else
		sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�������", main_color)
		work = true
	end
end

function info()
	sampShowDialog(1337, "{FFFF00}���������� � ������� {FFFFFF}FastLink", "{FFFF00}������ {FFFFFF}FastLink {FFFF00}��� ������ ��� ������� ����� ������ �� ���� � ��� �������� �������� �� ���\n{FFFF00}��� ������ � ���� �������� ������ ������ � ������� {FFFFFF}https://������{FFFF00} ���� {FFFFFF}http://������{FFFF00}, ������\n{FFFFFF}�������� {FFFF00}����������� ��������� � {FFFFFF}��������� {FFFF00}������� �� ��������� ������. ��� �� ������ �����\n{FFFF00}������������ � �� ������� �������� ������ �� ���� {FFFFFF}google.com/123/{FFFF00}, �� ������ ������� ���������, ������ ���:\n{FFFFFF}." .. table.concat(l,", .", 1, 19) .. "\n{FFFFFF}." .. table.concat(l,", .", 20, 42) .. "\n{FFFFFF}." .. table.concat(l,", .", 43, 65) .. "\n{FFFFFF}." .. table.concat(l,", .", 66, 87) .. "\n{FFFFFF}." .. table.concat(l,", .", 88, 108) .. "\n{FFFFFF}." .. table.concat(l,", .", 109, 129) .. "\n{FFFFFF}." .. table.concat(l,", .", 130, 150) .. "\n{FFFFFF}." .. table.concat(l,", .", 151, 171) .. "\n{FFFFFF}." .. table.concat(l,", .", 172, 192) .. "\n{FFFFFF}." .. table.concat(l,", .", 193, 213) .. "\n{FFFFFF}." .. table.concat(l,", .", 214, 234) .. "\n{FFFFFF}." .. table.concat(l,", .", 235, 255) .. "\n{FFFFFF}." .. table.concat(l,", .", 256, 274) .. "\n{FFFF00}����� ������ ���������/����� ����������� ������ � ���� (�� ��������� ���), ���������� ������ �������: {FFFFFF}/flinkwork\n{FFFF00}����� ��������� ������� {FFFFFF}����������{FFFF00} �������, ���������� ������ {FFFFFF}/flinkupdcheck\n{FFFF00}����� ������� ������� {FFFFFF}����������{FFFF00} �������, ���������� ������ {FFFFFF}/flinkupdhistory\n{FFFF00}� ������� ������� ����� ���� � ����� {FFFFFF}���������� {FFFF00}���������� ��������. ��� ��������� ����: {FFFFFF}/flinkmn\n{FFFF00}����� �������: {FFFFFF}https://vk.com/klamet1/{FFFF00}. ���� �� ����� ����� ���� {FFFFFF}���{FFFF00}, ������ ������ ��������\n{FFFFFF}�������������{FFFF00} ��� �������� ����� ���� {FFFFFF}������{FFFF00}, �� ������ ��� ������� �� {FFFFFF}���������\n{FFFF00}����� ����� ��������� � {FFFFFF}������������ �������������{FFFF00}. �� ������ �������� ������� ������� �� ��� {FFFFFF}QIWI\n{FFFF00}������� �� {FFFFFF}��������{FFFF00}, ��� ������� � {FFFFFF}QIWI{FFFF00} ��������: {FFFFFF}HADIV201{FFFF00}.\n{FFFFFF}������� {FFFF00}�� ������������� ����� �������. {FFFFFF}�������{FFFF00}, ��� ������ ������ ����� ����� ������ ������.", "{ff0000}�������", nil, DIALOG_STYLE_MSGBOX)
	if main_window.v then
		main_window.v = false
		windowActive = true
	end
end

function updinfo()
	os.execute("start https://vk.com/fastlink_samp")
	sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ������...", main_color)
end

function upd()
	if mbobnova then
		sampAddChatMessage(tag .. color_text .. "������� {FFFFFF}������������� {FFFF00}��������� ����������", main_color)
		main_window.v = not main_window.v
		imgui.Process = main_window.v
		obnova = true
	else
		sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�� �������{FFFF00}. ��������� ������� ���������� �������� ����� ����� {FFFFFF}/flinkupdcheck", main_color)
	end
end

function updcheck()
	if not checkupd then
		sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}������� ����������...", main_color)
		downloadUrlToFile(update_url, update_path, function(id, status)
			if status == dlstatus.STATUS_ENDDOWNLOADDATA then
				checkupd = true
				updateIni = inicfg.load(nil, update_path)
				if tonumber(updateIni.info.vers) > script_vers then
					sampAddChatMessage(tag .. color_text .. "���� {FFFFFF}����������{FFFF00}! ����� ������: {FFFFFF}" .. updateIni.info.vers_text .. "{FFFF00}. ������� ������: {FFFFFF}".. script_vers_text .. "{FFFF00}.", main_color)
					sampAddChatMessage(tag .. color_text .. "������ ��������� ����� � ������ ������� �� {FFFFFF}���������{FFFF00}. ������� ��� ��������: {FFFFFF}/flinkupdinfo", main_color)
					sampAddChatMessage(tag .. color_text .. "����� {FFFFFF}����������{FFFF00} ����������, ���������� ������ {FFFFFF}/flinkupd", main_color)
					mbobnova = true
					checkupd = false
				else
					checkupd = false
					sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�� �������{FFFF00}. ��������� ������� ���������� �������� ����� ����� {FFFFFF}/flinkupdcheck", main_color)
				end
				os.remove(update_path)
				checkupd = false
			end
		end)
	else
		sampAddChatMessage(tag .. color_text .. "��������� �������� �� ������� ���������� ���� {FFFFFF}�����{FFFF00}! ������ ��� �������� ������ ��������.", main_color)
	end
end

function fcp()
	if main_window.v then
		main_window.v = false
		posx, posy = getCursorPos()
		changepos = true
		two_window.v = true
		sampAddChatMessage(tag .. color_text .. "���� ������ �� ��������!", main_color)
		sampAddChatMessage(tag .. color_text .. "������� {FFFFFF}ENTER{FFFF00} ��������� ���� ����� �����. ������� {FFFFFF}ESC{FFFF00} ���������� ���� �� ������� �����", main_color)
		lua_thread.create(function ()
			while true do
				wait(0)
				if changepos then
					showCursor(true, true)
					posx, posy = getCursorPos()
					if isKeyJustPressed(VK_ESCAPE) then
						changepos = false
						showCursor(false, false)
						main_window.v = true
						sampAddChatMessage(tag .. color_text .. "���� ���� {FFFFFF}����������{FFFF00} �� ������� �������", main_color)
					elseif isKeyJustPressed(VK_RETURN) then
						changepos = false
						flinke.cfg.posx = posx
						flinke.cfg.posy = posy
						inicfg.save(flinke, "flinke")
						showCursor(false, false)
						main_window.v = true
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}���������{FFFF00} � ������. ��������� ����� ����������� ����� ������� ����� � ���� {FFFFFF}�������������", main_color)
					end
				end
			end
		end)
	else
		sampAddChatMessage(tag .. color_text .. "������� ����� {FFFFFF}������������{FFFF00} ���. ����. �����: {FFFFFF}/eurocounter", main_color)
	end
end

function fcr()
	if changepos then
		sampAddChatMessage(tag .. color_text .. "������� ����� {FFFFFF}�����{FFFF00} �� ������ ����� ������� ����", main_color)
	else
		flinke.cfg.posx = 0
		flinke.cfg.posy = sh / 2
		inicfg.save(flinke, "flinke")
		sampAddChatMessage(tag .. color_text .. "������� ���� ���� {FFFFFF}����������{FFFF00} �� ������� �� ���������", main_color)
		sampAddChatMessage(tag .. color_text .. "{FFFFFF}���������{FFFF00} � ������. ��������� ����� ����������� ����� ������� ����� � ���� {FFFFFF}�������������", main_color)
	end
end

function newssilkatime()
	lua_thread.create(function()
		while true do
			wait(0)
			if newssilkaa then
				table.insert(ln, ssilka)
				newssilkaa = false
				newssilka = true
				newssilkatime()
			end
		end
	end)
end

function examplee()
	if main_window.v then
		main_window.v = false
		example = true
		two_window.v = true
		lua_thread.create(function ()
			while true do
				wait(0)
				if example then
					if flinke.cfg.checksound then
						addOneOffSound(0.0, 0.0, 0.0, 1137)
						wait(100)
						addOneOffSound(0.0, 0.0, 0.0, 1138)
						wait(100)
						addOneOffSound(0.0, 0.0, 0.0, 1139)
					end
					wait(5000)
					example = false
					main_window.v = true
					break
				end
			end
		end)
	end
end

function addtoignorelocal()
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	local localignore = decodeJson(a)
	if #localignore["locall"] ~= 0 then
		local i = 1
		for _,v in ipairs(localignore["locall"]) do
			if local_text.v == v then
				sampAddChatMessage(tag .. color_text .. "����� ������ ��� ������������ � {FFFFFF}���������{FFFF00} �������������", main_color)
				break
			else
				i = i + 1
				if i > #localignore["locall"] then
					sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�������{FFFF00} ��������� � {FFFFFF}���������{FFFF00} �������������", main_color)
					table.insert(localignore["locall"], u8:decode(local_text.v))
					encodedTable = encodeJson(localignore)
					local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
					file:write(encodedTable)
					file:flush()
					file:close()
					break
				end
			end
		end
	else
		sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�������{FFFF00} ��������� � {FFFFFF}���������{FFFF00} �������������", main_color)
		table.insert(localignore["locall"], u8:decode(local_text.v))
		encodedTable = encodeJson(localignore)
		local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
		file:write(encodedTable)
		file:flush()
		file:close()
	end
end

function deleteignorelinklocal()
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	i = 1
	local decodea = decodeJson(a)
	for _, v in ipairs(decodea["locall"]) do
		if local_text.v == v then
			table.remove(decodea["locall"], i)
			linkDeleted = true
			sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}������� {FFFF00}�������:", main_color)
			sampAddChatMessage(tag .. "{FFFFFF}" .. v, main_color)
			break
		else
			i = i + 1
		end
	end
	if not linkDeleted then
		sampAddChatMessage(tag .. color_text .. "������ ������ {FFFFFF}�� �������{FFFF00} � {FFFFFF}���������{FFFF00} �������������", main_color)
	else
		linkDeleted = false
	end
	encodedTable = encodeJson(decodea)
	local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
	file:write(encodedTable)
	file:flush()
	file:close()
end

function showignorelocal() 
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	sampAddChatMessage(tag .. color_text .. "���� � ��� ����� {FFFFFF}��������{FFFF00} ��� ������, ������� ��������� � {FFFFFF}���������{FFFF00} �������������", main_color)
	local decodea = decodeJson(a)
	for _, v in ipairs(decodea["locall"]) do
		sampAddChatMessage(tag .. "{FFFFFF}" .. v, main_color)
	end
	sampAddChatMessage(tag .. color_text .. "������ � {FFFFFF}��������� {FFFF00}������������� ��������� {FFFFFF}" .. #decodea["locall"] .. " {FFFF00}������", main_color)
end

function deletealllocal()
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	local decodea = decodeJson(a)
	if #decodea["locall"] ~= 0 then
		local count = #decodea["locall"]
		for i = 1, count do
			table.remove(decodea["locall"], 1)
		end
		sampAddChatMessage(tag .. color_text .. "��� ������ �� {FFFFFF}���������� {FFFF00}������������� ����{FFFFFF} ������� {FFFF00}�������", main_color)
		encodedTable = encodeJson(decodea)
		local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
		file:write(encodedTable)
		file:flush()
		file:close()
	else
		sampAddChatMessage(tag .. color_text .. "� {FFFFFF}���������{FFFF00} ������������� ��� �� ����� ������", main_color)
	end
end

function addtoignoreglobal()
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	local globalignore = decodeJson(a)
	if #globalignore["globall"] ~= 0 then
		local i = 1
		for _,v in ipairs(globalignore["globall"]) do
			if global_text.v == v then
				sampAddChatMessage(tag .. color_text .. "����� ������ ��� ������������ � {FFFFFF}����������{FFFF00} �������������", main_color)
				break
			else
				i = i + 1
				if i > #globalignore["globall"] then
					sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�������{FFFF00} ��������� � {FFFFFF}����������{FFFF00} �������������", main_color)
					table.insert(globalignore["globall"], u8:decode(global_text.v))
					encodedTable = encodeJson(globalignore)
					local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
					file:write(encodedTable)
					file:flush()
					file:close()
					break
				end
			end
		end
	else
		sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�������{FFFF00} ��������� � {FFFFFF}����������{FFFF00} �������������", main_color)
		table.insert(globalignore["globall"], u8:decode(global_text.v))
		encodedTable = encodeJson(globalignore)
		local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
		file:write(encodedTable)
		file:flush()
		file:close()
	end
end

function deleteignorelinkglobal()
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	i = 1
	local decodea = decodeJson(a)
	for _, v in ipairs(decodea["globall"]) do   
		if global_text.v == v then
			table.remove(decodea["globall"], i)
			linkDeleted = true
			sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}������� {FFFF00}�������:", main_color)
			sampAddChatMessage(tag .. "{FFFFFF}" .. v, main_color)
			break
		else
			i = i + 1
		end
	end
	if not linkDeleted then
		sampAddChatMessage(tag .. color_text .. "������ ������ {FFFFFF}�� �������{FFFF00} � {FFFFFF}����������{FFFF00} �������������", main_color)
	else
		linkDeleted = false
	end
	encodedTable = encodeJson(decodea)
	local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
	file:write(encodedTable)
	file:flush()
	file:close()
end

function showignoreglobal() 
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	sampAddChatMessage(tag .. color_text .. "���� � ��� ����� {FFFFFF}��������{FFFF00} ��� ������, ������� ��������� � {FFFFFF}����������{FFFF00} �������������", main_color)
	local decodea = decodeJson(a)
	for _, v in ipairs(decodea["globall"]) do
		sampAddChatMessage(tag .. "{FFFFFF}" .. v, main_color)
	end
	sampAddChatMessage(tag .. color_text .. "������ � {FFFFFF}���������� {FFFF00}������������� ��������� {FFFFFF}" .. #decodea["globall"] .. " {FFFF00}������", main_color)
end

function deleteallglobal()
	local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
	a = file:read("*a")
	file:close()
	local decodea = decodeJson(a)
	if #decodea["globall"] ~= 0 then
		local count = #decodea["globall"]
		for i = 1, count do
			table.remove(decodea["globall"], 1)
		end
		sampAddChatMessage(tag .. color_text .. "��� ������ �� {FFFFFF}���������� {FFFF00}������������� ����{FFFFFF} ������� {FFFF00}�������", main_color)
		encodedTable = encodeJson(decodea)
		local file = io.open(MoonFolder .."\\config\\llinks.json", "w")
		file:write(encodedTable)
		file:flush()
		file:close()
	else
		sampAddChatMessage(tag .. color_text .. "� {FFFFFF}����������{FFFF00} ������������� ��� �� ����� ������", main_color)
	end
end

function mn()
	main_window.v = not main_window.v
	imgui.Process = main_window.v
end

function history()
	sampShowDialog(1337, "{FFFF00}������� ���������� ������� {FFFFFF}FastLink", "{FFFF00}������ {FFFFFF}1.0{FFFF00}:\n{FFFFFF}- �����\n{FFFF00}������ {FFFFFF}1.1{FFFF00}:\n{FFFFFF}- ������ ���� � ������ ��� https:// ��� http://, ������ ������ ��� ������, ���� � ��� ����� ���� �� ������� �� �������\n{FFFF00}������ {FFFFFF}1.2{FFFF00}:\n{FFFFFF}- ���� ��������� �������, ������������ ��� ���������� � �������, \"/flinkinfo\"\n- ���� ��������� ����������� ��������� ������ (�� ��������� �������), \"/flinkwork\"\n{FFFF00}������ {FFFFFF}1.21{FFFF00}:\n{FFFFFF}- �������� �����: .sk (��� ������ �����)\n{FFFF00}������ {FFFFFF}1.3{FFFF00}:\n{FFFFFF}- ��������� ����� ����� ����� �������\n{FFFF00}������ {FFFFFF}1.31{FFFF00}:\n{FFFFFF}- ����� ������ ����������� ������ � ���� (�������� �� ������)\n{FFFF00}������ {FFFFFF}1.4{FFFF00}:\n{FFFFFF}- ��������� ����-���������� ������� �� �������, \"/flinkupd\"\n- ��������� �������, ����������� ������� ���������� �������, \"/flinkupdcheck\"\n- ��������� �������, ������� ��������� � ������ ������� �� ��������� (����� ������ ������� �� �����������), \"/flinkupdinfo\"\n- ��������� �������, ������������ ������� ���������� �������, \"/flinkupdhistory\"\n{FFFF00}������ {FFFFFF}1.5{FFFF00}:\n{FFFFFF}- ������ ������ ��� ������������� ��� ����������� ���������� (�� ������ ������ �����, �� ��������)\n- ������ ��� ����� �������, ����� �������� ��������������� ���������� ����\n{FFFF00}������ {FFFFFF}1.6{FFFF00}:\n{FFFFFF}- ���������� ��������, ����� ������ ������ ��� ������� ���\n{FFFFFF}- ������� ���� {FFFFFF}�������{FFFF00}:\n     {FFFFFF}/fastlink - /flink\n     /fastlinkwork - /flinkwork\n     /fastlinkupdate - /flinkupd\n     /fastlinkupdatecheck - /flinkupdcheck\n     /fastlinkupdateinfo - /flinkupdinfo\n     /fastlinkupdatehistory - /flinkupdhistory\n{FFFF00}������ {FFFFFF}2.0{FFFF00}:\n{FFFFFF}- � ������ ���� ��������� ����� ImGui (Immediate Mode Graphic user interface) ����, � ������� ����� ��������� ������, � ����� ������� ���� ����������� ��� ��������� ��������� ������, \"/flinkmn\"\n{FFFF00}������ {FFFFFF}2.1{FFFF00}:\n{FFFFFF}- ������ ������ ����� �������� ��������� ������ �� ������ � ���, �� ��� � � ���. ImGui ����!\n- � \"/flinkmn\" ��������� ����� ���������, ����� ���:\n     - ����� ������ ��������� ������ (��� ���� ����� ���. ImGui ����)\n     - ��������� ������� ���. ImGui ���� (������ ���������� ������ ���� ������� ��������� �������� ��������� ������ � ����� ���. ImGui ����)\n     - ����� ������� ���. ImGui ���� (������ ���������� ������ ���� ������� ��������� �������� ��������� ������ � ����� ���. ImGui ����)\n{FFFF00}������ {FFFFFF}2.2{FFFF00}:\n{FFFFFF}- ��������� �����, ����� ImGui ����!\n{FFFFFF}- ��������� 5 ����� �������\n{FFFFFF}- � \"/flinkmn\" ��������� ����� ���������, ����� ���:\n     - ���������������� ����� ��� ���������� ������\n     - ������� ������������� ������\n     - ��������� ����� �� ������� �� �������\n     - ������������� ������� ����� ��� ������������ ����������\n     - ��������� ������������ �����", "{ff0000}�������", nil, DIALOG_STYLE_MSGBOX)
	if main_window.v then
		main_window.v = false
		windowActive = true
	end
end

function sampev.onServerMessage(color, msg)
	if work then
		if msg:find("https://(%S+)") then
			if ssilka ~= nil then
				if ssilka2 ~= nil then
					ssilka3 = ssilka2
					time3 = time2
					time2 = time1
				else
					ssilka2 = ssilka
					time2 = time1
				end
				ssilka2 = ssilka
				time2 = time1
			end
			naideno = true
			ssilka = msg:match("https://(%S+)")
			ssilka = ssilka:gsub('{......}', '')
			ssilka = ssilka:gsub('%)', '')
			ssilka = ssilka:gsub('%]', '')
			ssilka = ssilka:gsub('\"', '')
			ssilka = ssilka:gsub('\'', '')
			ssilka = ssilka:gsub('%,', '')
			if ssilka:match("https://%S+%.") then
				ssilka = ssilka:gsub('%.$', '')
			end
			time1 = os.date("%X")
			local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
			a = file:read("*a")
			file:close()
			plenty = decodeJson(a)
			if #plenty["globall"] ~= 0 then
				for _,v in ipairs(plenty["globall"]) do
					if v ~= ssilka then
						ssilka = "https://" .. ssilka
						break
						for _,v in ipairs(plenty["locall"]) do
							if v ~= ssilka then
								ssilka = "https://" .. ssilka
								abobus = true
								naideno = true
								if flinke.cfg.cchat then
									if oneKey then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif double then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif triple then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									end
									sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
									if flinke.cfg.checksound then
										lua_thread.create(function()
											while true do
												wait(0)
												addOneOffSound(0.0, 0.0, 0.0, 1137)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1138)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1139)
												break
											end
										end)
									end
								elseif flinke.cfg.cimgui then
									newssilkaa = true
									newssilkatime()
								end
								break
							else
								if not ssilka:match("https://%S+") then
									ssilka = "https://" .. ssilka
								end
							end
						end
					else
						if not ssilka:match("https://%S+") then
							ssilka = "https://" .. ssilka
						end
					end
				end
			else
				if #plenty["locall"] ~= 0 then
					for _,v in ipairs(plenty["locall"]) do
						if v ~= ssilka then
							ssilka = "https://" .. ssilka
							abobus = true
							naideno = true
							if flinke.cfg.cchat then
								if oneKey then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif double then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif triple then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								end
								sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
								if flinke.cfg.checksound then
									lua_thread.create(function()
										while true do
											wait(0)
											addOneOffSound(0.0, 0.0, 0.0, 1137)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1138)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1139)
											break
										end
									end)
								end
							elseif flinke.cfg.cimgui then
								newssilkaa = true
								newssilkatime()
							end
							break
						else
							if not ssilka:match("https://%S+") then
									ssilka = "https://" .. ssilka
							end
						end
					end
				else
					ssilka = "https://" .. ssilka
					abobus = true
					naideno = true
					if flinke.cfg.cchat then
						if oneKey then
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
						elseif double then
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
						elseif triple then
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
						end
						sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
						if flinke.cfg.checksound then
							lua_thread.create(function()
								while true do
									wait(0)
									addOneOffSound(0.0, 0.0, 0.0, 1137)
									wait(100)
									addOneOffSound(0.0, 0.0, 0.0, 1138)
									wait(100)
									addOneOffSound(0.0, 0.0, 0.0, 1139)
									break
								end
							end)
						end
					elseif flinke.cfg.cimgui then
						newssilkaa = true
						newssilkatime()
					end
				end
				if not ssilka:match("https://%S+") then
					ssilka = "https://" .. ssilka
				end
			end
		end

		if msg:find("http://(%S+)") then
			if ssilka ~= nil then
				if ssilka2 ~= nil then
					ssilka3 = ssilka2
					time3 = time2
					time2 = time1
				else
					ssilka2 = ssilka
					time2 = time1
				end
				ssilka2 = ssilka
				time2 = time1
			end
			naideno = true
			ssilka = msg:match("http://(%S+)")
			ssilka = ssilka:gsub('{......}', '')
			ssilka = ssilka:gsub('%)', '')
			ssilka = ssilka:gsub('%]', '')
			ssilka = ssilka:gsub('\"', '')
			ssilka = ssilka:gsub('\'', '')
			ssilka = ssilka:gsub('%,', '')
			if ssilka:match("http://%S+%.") then
				ssilka = ssilka:gsub('%.$', '')
			end
			time1 = os.date("%X")
			local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
			a = file:read("*a")
			file:close()
			plenty = decodeJson(a)
			if #plenty["globall"] ~= 0 then
				for _,v in ipairs(plenty["globall"]) do
					if v ~= ssilka then
						ssilka = "http://" .. ssilka
						break
						for _,v in ipairs(plenty["locall"]) do
							if v ~= ssilka then
								ssilka = "http://" .. ssilka
								abobus = true
								naideno = true
								if flinke.cfg.cchat then
									if oneKey then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif double then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif triple then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									end
									sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
									if flinke.cfg.checksound then
										lua_thread.create(function()
											while true do
												wait(0)
												addOneOffSound(0.0, 0.0, 0.0, 1137)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1138)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1139)
												break
											end
										end)
									end
								elseif flinke.cfg.cimgui then
									newssilkaa = true
									newssilkatime()
								end
								break
							else
								if not ssilka:match("http://%S+") then
									ssilka = "http://" .. ssilka
								end
							end
						end
					else
						if not ssilka:match("http://%S+") then
							ssilka = "http://" .. ssilka
						end
					end
				end
			else
				if #plenty["locall"] ~= 0 then
					for _,v in ipairs(plenty["locall"]) do
						if v ~= ssilka then
							ssilka = "http://" .. ssilka
							abobus = true
							naideno = true
							if flinke.cfg.cchat then
								if oneKey then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif double then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif triple then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								end
								sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
								if flinke.cfg.checksound then
									lua_thread.create(function()
										while true do
											wait(0)
											addOneOffSound(0.0, 0.0, 0.0, 1137)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1138)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1139)
											break
										end
									end)
								end
							elseif flinke.cfg.cimgui then
								newssilkaa = true
								newssilkatime()
							end
							break
						else
							if not ssilka:match("http://%S+") then
								ssilka = "http://" .. ssilka
							end
						end
					end
				else
					ssilka = "http://" .. ssilka
					abobus = true
					naideno = true
					if flinke.cfg.cchat then
						if oneKey then
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
						elseif double then
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
						elseif triple then
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
						end
						sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
						if flinke.cfg.checksound then
							lua_thread.create(function()
								while true do
									wait(0)
									addOneOffSound(0.0, 0.0, 0.0, 1137)
									wait(100)
									addOneOffSound(0.0, 0.0, 0.0, 1138)
									wait(100)
									addOneOffSound(0.0, 0.0, 0.0, 1139)
									break
								end
							end)
						end
					elseif flinke.cfg.cimgui then
						newssilkaa = true
						newssilkatime()
					end
				end
				if not ssilka:match("http://%S+") then
					ssilka = "http://" .. ssilka
				end
			end
		end

		if not naideno then
			for _,v in ipairs(l) do
				if msg:match("(%S+)%." .. v .. "/(%S+)") then
					if ssilka ~= nil then
						if ssilka2 ~= nil then
							ssilka3 = ssilka2
							time3 = time2
							time2 = time1
						else
							ssilka2 = ssilka
							time2 = time1
						end
						ssilka2 = ssilka
						time2 = time1
					end
					time1 = os.date("%X")
					ssilka, two_ssilka = msg:match("(%S+)%." .. v .. "/(%S+)")
					ssilka = ssilka .. "." .. v .. "/" .. two_ssilka
					if msg:match("www.%S+%." .. v .. "/%S+") then
						ssilka, two_ssilka = msg:match("www.(%S+)%." .. v .. "/(%S+)")
						ssilka = ssilka .. "." .. v .. "/" .. two_ssilka
						ssilka = ssilka:gsub('{......}', '')
						ssilka = ssilka:gsub('%(', '')
						ssilka = ssilka:gsub('%)', '')
						ssilka = ssilka:gsub('%[', '')
						ssilka = ssilka:gsub('%]', '')
						ssilka = ssilka:gsub('%,', '')
						ssilka = ssilka:gsub('\"', '')
						ssilka = ssilka:gsub('\'', '')
						if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
							ssilka = ssilka:gsub('%.$', '')
						elseif ssilka:match("www.%S+%." .. v .. "/%.") then
							ssilka = ssilka:gsub('%.$', '')
						end
					else
						ssilka = ssilka:gsub('{......}', '')
						ssilka = ssilka:gsub('%(', '')
						ssilka = ssilka:gsub('%)', '')
						ssilka = ssilka:gsub('%[', '')
						ssilka = ssilka:gsub('%]', '')
						ssilka = ssilka:gsub('%,', '')
						ssilka = ssilka:gsub('\"', '')
						ssilka = ssilka:gsub('\'', '')
						if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
							ssilka = ssilka:gsub('%.$', '')
						elseif ssilka:match("www.%S+%." .. v .. "/%.") then
							ssilka = ssilka:gsub('%.$', '')
						end
					end
					local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
					a = file:read("*a")
					file:close()
					plenty = decodeJson(a)
					if #plenty["globall"] ~= 0 then
						for _,v in ipairs(plenty["globall"]) do
							if v ~= ssilka then
								if not msg:match("www.%S+%." .. v .. "/%S+") then
									ssilka = "www." .. ssilka
								end
								break
								for _,v in ipairs(plenty["locall"]) do
									if v ~= ssilka then
										if msg:match("www.%S+%." .. v .. "/%S+") then
											ssilka = ssilka:gsub('{......}', '')
											ssilka = ssilka:gsub('%(', '')
											ssilka = ssilka:gsub('%)', '')
											ssilka = ssilka:gsub('%[', '')
											ssilka = ssilka:gsub('%]', '')
											ssilka = ssilka:gsub('%,', '')
											ssilka = ssilka:gsub('\"', '')
											ssilka = ssilka:gsub('\'', '')
											if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
												ssilka = ssilka:gsub('%.$', '')
											elseif ssilka:match("www.%S+%." .. v .. "/%.") then
												ssilka = ssilka:gsub('%.$', '')
											end
										else
											ssilka = "www." .. ssilka
											ssilka = ssilka:gsub('{......}', '')
											ssilka = ssilka:gsub('%(', '')
											ssilka = ssilka:gsub('%)', '')
											ssilka = ssilka:gsub('%[', '')
											ssilka = ssilka:gsub('%]', '')
											ssilka = ssilka:gsub('%,', '')
											ssilka = ssilka:gsub('\"', '')
											ssilka = ssilka:gsub('\'', '')
											if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
												ssilka = ssilka:gsub('%.$', '')
											elseif ssilka:match("www.%S+%." .. v .. "/%.") then
												ssilka = ssilka:gsub('%.$', '')
											end
										end
										abobus = true
										if flinke.cfg.cchat then
											if oneKey then
												sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
											elseif double then
												sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
											elseif triple then
												sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
											end
											sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
											if flinke.cfg.checksound then
												lua_thread.create(function()
													while true do
														wait(0)
														addOneOffSound(0.0, 0.0, 0.0, 1137)
														wait(100)
														addOneOffSound(0.0, 0.0, 0.0, 1138)
														wait(100)
														addOneOffSound(0.0, 0.0, 0.0, 1139)
														break
													end
												end)
											end
										elseif flinke.cfg.cimgui then
											newssilkaa = true
											newssilkatime()
										end
										break
									else
										if not msg:match("www.%S+%." .. v .. "/%S+") then
											ssilka = "www." .. ssilka
										end
									end
								end
							else
								if not msg:match("www.%S+%." .. v .. "/%S+") then
									ssilka = "www." .. ssilka
								end
							end
						end
					else
						if #plenty["locall"] ~= 0 then
							for _,v in ipairs(plenty["locall"]) do
								if v ~= ssilka then
									if msg:match("www.%S+%." .. v .. "/%S+") then
										ssilka = ssilka:gsub('{......}', '')
										ssilka = ssilka:gsub('%(', '')
										ssilka = ssilka:gsub('%)', '')
										ssilka = ssilka:gsub('%[', '')
										ssilka = ssilka:gsub('%]', '')
										ssilka = ssilka:gsub('%,', '')
										ssilka = ssilka:gsub('\"', '')
										ssilka = ssilka:gsub('\'', '')
										if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
											ssilka = ssilka:gsub('%.$', '')
										elseif ssilka:match("www.%S+%." .. v .. "/%.") then
											ssilka = ssilka:gsub('%.$', '')
										end
									else
										ssilka = "www." .. ssilka
										ssilka = ssilka:gsub('{......}', '')
										ssilka = ssilka:gsub('%(', '')
										ssilka = ssilka:gsub('%)', '')
										ssilka = ssilka:gsub('%[', '')
										ssilka = ssilka:gsub('%]', '')
										ssilka = ssilka:gsub('%,', '')
										ssilka = ssilka:gsub('\"', '')
										ssilka = ssilka:gsub('\'', '')
										if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
											ssilka = ssilka:gsub('%.$', '')
										elseif ssilka:match("www.%S+%." .. v .. "/%.") then
											ssilka = ssilka:gsub('%.$', '')
										end
									end
									abobus = true
									if flinke.cfg.cchat then
										if oneKey then
											sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
										elseif double then
											sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
										elseif triple then
											sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
										end
										sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
										if flinke.cfg.checksound then
											lua_thread.create(function()
												while true do
													wait(0)
													addOneOffSound(0.0, 0.0, 0.0, 1137)
													wait(100)
													addOneOffSound(0.0, 0.0, 0.0, 1138)
													wait(100)
													addOneOffSound(0.0, 0.0, 0.0, 1139)
													break
												end
											end)
										end
									elseif flinke.cfg.cimgui then
										newssilkaa = true
										newssilkatime()
									end
									break
								else
									if not msg:match("www.%S+%." .. v .. "/%S+") then
										ssilka = "www." .. ssilka
									end
								end
							end
						else
							if msg:match("www.%S+%." .. v .. "/%S+") then
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('%,', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
								if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
									ssilka = ssilka:gsub('%.$', '')
								elseif ssilka:match("www.%S+%." .. v .. "/%.") then
									ssilka = ssilka:gsub('%.$', '')
								end
							else
								ssilka = "www." .. ssilka
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('%,', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
								if ssilka:match("www.%S+%." .. v .. "/%S+%.") then
									ssilka = ssilka:gsub('%.$', '')
								elseif ssilka:match("www.%S+%." .. v .. "/%.") then
									ssilka = ssilka:gsub('%.$', '')
								end
							end
							abobus = true
							if flinke.cfg.cchat then
								if oneKey then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif double then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif triple then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								end
								sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
								if flinke.cfg.checksound then
									lua_thread.create(function()
										while true do
											wait(0)
											addOneOffSound(0.0, 0.0, 0.0, 1137)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1138)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1139)
											break
										end
									end)
								end
							elseif flinke.cfg.cimgui then
								newssilkaa = true
								newssilkatime()
							end
							break
						end
					end

				elseif msg:match("(%S+)%." .. v .. "/") and not naideno then
					if msg:match("(%S+)%." .. v .. "/") then
						if ssilka ~= nil then
							if ssilka2 ~= nil then
								ssilka3 = ssilka2
								time3 = time2
								time2 = time1
							else
								ssilka2 = ssilka
								time2 = time1
							end
							ssilka2 = ssilka
							time2 = time1
						end
						time1 = os.date("%X")
						ssilka = msg:match("(%S+)%." .. v .. "/")
						if msg:match("www.%S+%." .. v .. "/") then
							ssilka = ssilka .. "." .. v .. "/"
							ssilka = ssilka:gsub('{......}', '')
							ssilka = ssilka:gsub('%(', '')
							ssilka = ssilka:gsub('%)', '')
							ssilka = ssilka:gsub('%[', '')
							ssilka = ssilka:gsub('%]', '')
							ssilka = ssilka:gsub('%,', '')
							ssilka = ssilka:gsub('\"', '')
							ssilka = ssilka:gsub('\'', '')
							if ssilka:match("www.%S+%." .. v .. "/%.") then
								ssilka = ssilka:gsub('%.$', '')
							end
						else
							ssilka = ssilka:gsub('{......}', '')
							ssilka = ssilka:gsub('%(', '')
							ssilka = ssilka:gsub('%)', '')
							ssilka = ssilka:gsub('%[', '')
							ssilka = ssilka:gsub('%]', '')
							ssilka = ssilka:gsub('%,', '')
							ssilka = ssilka:gsub('\"', '')
							ssilka = ssilka:gsub('\'', '')
							if ssilka:match("www.%S+%." .. v .. "/%.") then
								ssilka = ssilka:gsub('%.$', '')
							end
						end
						local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
						a = file:read("*a")
						file:close()
						plenty = decodeJson(a)
						if #plenty["globall"] ~= 0 then
							for _,value in ipairs(plenty["globall"]) do
								va = value
								va = va .. "/"
								if va ~= ssilka then
									if not msg:match("www.%S+%." .. v .. "/") then
										ssilka = "www." .. ssilka .. "." .. v .. "/"
									end
									break
								else
									if not msg:match("www.%S+%." .. v .. "/") then
										ssilka = "www." .. ssilka .. "." .. v .. "/"
									end
								end
							end
						else
							if msg:match("www.%S+%." .. v .. "/") then
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('%,', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
								if ssilka:match("www.%S+%." .. v .. "/%.") then
									ssilka = ssilka:gsub('%.$', '')
								end
							else
								ssilka = "www." .. ssilka .. "." .. v .. "/"
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('%,', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
								if ssilka:match("www.%S+%." .. v .. "/%.") then
									ssilka = ssilka:gsub('%.$', '')
								end
							end
							abobus = true
							if flinke.cfg.cchat then
								if oneKey then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif double then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif triple then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								end
								sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
								if flinke.cfg.checksound then
									lua_thread.create(function()
										while true do
											wait(0)
											addOneOffSound(0.0, 0.0, 0.0, 1137)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1138)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1139)
											break
										end
									end)
								end
							elseif flinke.cfg.cimgui then
								newssilkaa = true
								newssilkatime()
							end
							break
						end
					end

				elseif msg:match("(%S+)%." .. v .. ",") and not naideno then
					if msg:match("(%S+)%." .. v .. ",") then
						if not msg:match("(%S+)%." .. v .. ",%S+") then
							if ssilka ~= nil then
								if ssilka2 ~= nil then
									ssilka3 = ssilka2
									time3 = time2
									time2 = time1
								else
									ssilka2 = ssilka
									time2 = time1
								end
								ssilka2 = ssilka
								time2 = time1
							end
							time1 = os.date("%X")
							ssilka = msg:match("(%S+)%." .. v)
							if msg:match("www.%S+%." .. v) then
								ssilka = ssilka .. "." .. v
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							else
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							end
							local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
							a = file:read("*a")
							file:close()
							plenty = decodeJson(a)
							if #plenty["globall"] ~= 0 then
								for _,value in ipairs(plenty["globall"]) do
									va = value:match("(%S+)%." .. v)
									va = va .. "." .. v
									if va ~= ssilka then
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
										break
									else
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
									end
								end
							else
								if msg:match("www.%S+%." .. v) then
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								else
									ssilka = "www." .. ssilka .. "." .. v
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								end
								abobus = true
								if flinke.cfg.cchat then
									if oneKey then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif double then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif triple then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									end
									sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
									if flinke.cfg.checksound then
										lua_thread.create(function()
											while true do
												wait(0)
												addOneOffSound(0.0, 0.0, 0.0, 1137)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1138)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1139)
												break
											end
										end)
									end
								elseif flinke.cfg.cimgui then
									newssilkaa = true
									newssilkatime()
								end
							end
						end
					end

				elseif msg:match("(%S+)%." .. v .. "%.") then
					if not msg:match("(%S+)%." .. v .. "%.S+") then
						if ssilka ~= nil then
							if ssilka2 ~= nil then
								ssilka3 = ssilka2
								time3 = time2
								time2 = time1
							else
								ssilka2 = ssilka
								time2 = time1
							end
							ssilka2 = ssilka
							time2 = time1
						end
						time1 = os.date("%X")
						ssilka = msg:match("(%S+)%." .. v)
						if msg:match("www.%S+%." .. v .. "%.") then
							ssilka = ssilka .. "." .. v
							ssilka = ssilka:gsub('{......}', '')
							ssilka = ssilka:gsub('%(', '')
							ssilka = ssilka:gsub('%)', '')
							ssilka = ssilka:gsub('%[', '')
							ssilka = ssilka:gsub('%]', '')
							ssilka = ssilka:gsub('\"', '')
							ssilka = ssilka:gsub('\'', '')
							if ssilka:match("www.%S+%." .. v .. "%.") then
								ssilka = ssilka:gsub('%.$', '')
							end
						else
							ssilka = ssilka:gsub('{......}', '')
							ssilka = ssilka:gsub('%(', '')
							ssilka = ssilka:gsub('%)', '')
							ssilka = ssilka:gsub('%[', '')
							ssilka = ssilka:gsub('%]', '')
							ssilka = ssilka:gsub('\"', '')
							ssilka = ssilka:gsub('\'', '')
							if ssilka:match("%S+%." .. v .. "%.") then
								ssilka = ssilka:gsub('%.$', '')
							end
						end
						local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
						a = file:read("*a")
						file:close()
						plenty = decodeJson(a)
						if #plenty["globall"] ~= 0 then
							for _,value in ipairs(plenty["globall"]) do
								va = value:match("(%S+)%." .. v)
								va = va .. "." .. v
								if va ~= ssilka then
									if not msg:match("www.%S+%." .. v) then
										ssilka = "www." .. ssilka .. "." .. v
									end
									break
								else
									if not msg:match("www.%S+%." .. v) then
										ssilka = "www." .. ssilka .. "." .. v
									end
								end
							end
						else
							if msg:match("www.%S+%." .. v) then
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('%,', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							else
								ssilka = "www." .. ssilka .. "." .. v
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('%,', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							end
							abobus = true
							if flinke.cfg.cchat then
								if oneKey then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif double then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								elseif triple then
									sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
								end
								sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
								if flinke.cfg.checksound then
									lua_thread.create(function()
										while true do
											wait(0)
											addOneOffSound(0.0, 0.0, 0.0, 1137)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1138)
											wait(100)
											addOneOffSound(0.0, 0.0, 0.0, 1139)
											break
										end
									end)
								end
							elseif flinke.cfg.cimgui then
								newssilkaa = true
								newssilkatime()
							end
						end
					end

				elseif msg:match("%((%S+)%." .. v .. "%)") and not naideno then
					if msg:match("%((%S+)%." .. v .. "%)") then
						if not msg:match("(%S+)%." .. v .. "%)%S+") then
							if ssilka ~= nil then
								if ssilka2 ~= nil then
									ssilka3 = ssilka2
									time3 = time2
									time2 = time1
								else
									ssilka2 = ssilka
									time2 = time1
								end
								ssilka2 = ssilka
								time2 = time1
							end
							time1 = os.date("%X")
							ssilka = msg:match("(%S+)%." .. v)
							if msg:match("www.%S+%." .. v) then
								ssilka = ssilka .. "." .. v
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							else
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							end
							local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
							a = file:read("*a")
							file:close()
							plenty = decodeJson(a)
							if #plenty["globall"] ~= 0 then
								for _,value in ipairs(plenty["globall"]) do
									va = value:match("(%S+)%." .. v)
									va = va .. "." .. v
									if va ~= ssilka then
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
										break
									else
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
									end
								end
							else
								if msg:match("www.%S+%." .. v) then
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								else
									ssilka = "www." .. ssilka .. "." .. v
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								end
								abobus = true
								if flinke.cfg.cchat then
									if oneKey then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif double then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif triple then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									end
									sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
									if flinke.cfg.checksound then
										lua_thread.create(function()
											while true do
												wait(0)
												addOneOffSound(0.0, 0.0, 0.0, 1137)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1138)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1139)
												break
											end
										end)
									end
								elseif flinke.cfg.cimgui then
									newssilkaa = true
									newssilkatime()
								end
							end
						end
					end

				elseif msg:match("%[(%S+)%." .. v .. "%]") and not naideno then
					if msg:match("%[(%S+)%." .. v .. "%]") then
						if not msg:match("(%S+)%." .. v .. "%]%S+") then
							if ssilka ~= nil then
								if ssilka2 ~= nil then
									ssilka3 = ssilka2
									time3 = time2
									time2 = time1
								else
									ssilka2 = ssilka
									time2 = time1
								end
								ssilka2 = ssilka
								time2 = time1
							end
							time1 = os.date("%X")
							ssilka = msg:match("(%S+)%." .. v)
							if msg:match("www.%S+%." .. v) then
								ssilka = ssilka .. "." .. v
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							else
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							end
							local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
							a = file:read("*a")
							file:close()
							plenty = decodeJson(a)
							if #plenty["globall"] ~= 0 then
								for _,value in ipairs(plenty["globall"]) do
									va = value:match("(%S+)%." .. v)
									va = va .. "." .. v
									if va ~= ssilka then
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
										break
									else
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
									end
								end
							else
								if msg:match("www.%S+%." .. v) then
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								else
									ssilka = "www." .. ssilka .. "." .. v
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								end
								abobus = true
								if flinke.cfg.cchat then
									if oneKey then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif double then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif triple then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									end
									sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
									if flinke.cfg.checksound then
										lua_thread.create(function()
											while true do
												wait(0)
												addOneOffSound(0.0, 0.0, 0.0, 1137)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1138)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1139)
												break
											end
										end)
									end
								elseif flinke.cfg.cimgui then
									newssilkaa = true
									newssilkatime()
								end
							end
						end
					end

				elseif msg:match("(%S+)%." .. v) and not naideno then
					if msg:match("(%S+)%." .. v) then
						if not msg:match("(%S+)%." .. v .. "%S+") then
							if ssilka ~= nil then
								if ssilka2 ~= nil then
									ssilka3 = ssilka2
									time3 = time2
									time2 = time1
								else
									ssilka2 = ssilka
									time2 = time1
								end
								ssilka2 = ssilka
								time2 = time1
							end
							time1 = os.date("%X")
							ssilka = msg:match("(%S+)%." .. v)
							if msg:match("www.%S+%." .. v) then
								ssilka = ssilka .. "." .. v
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							else
								ssilka = ssilka:gsub('{......}', '')
								ssilka = ssilka:gsub('%(', '')
								ssilka = ssilka:gsub('%)', '')
								ssilka = ssilka:gsub('%[', '')
								ssilka = ssilka:gsub('%]', '')
								ssilka = ssilka:gsub('\"', '')
								ssilka = ssilka:gsub('\'', '')
							end
							local file = io.open(MoonFolder .."\\config\\llinks.json", "r")
							a = file:read("*a")
							file:close()
							plenty = decodeJson(a)
							if #plenty["globall"] ~= 0 then
								for _,value in ipairs(plenty["globall"]) do
									va = value:match("(%S+)%." .. v)
									va = va .. "." .. v
									if va ~= ssilka then
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
										break
									else
										if not msg:match("www.%S+%." .. v) then
											ssilka = "www." .. ssilka .. "." .. v
										end
									end
								end
							else
								if msg:match("www.%S+%." .. v) then
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								else
									ssilka = "www." .. ssilka .. "." .. v
									ssilka = ssilka:gsub('{......}', '')
									ssilka = ssilka:gsub('%(', '')
									ssilka = ssilka:gsub('%)', '')
									ssilka = ssilka:gsub('%[', '')
									ssilka = ssilka:gsub('%]', '')
									ssilka = ssilka:gsub('%,', '')
									ssilka = ssilka:gsub('\"', '')
									ssilka = ssilka:gsub('\'', '')
								end
								abobus = true
								if flinke.cfg.cchat then
									if oneKey then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif double then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									elseif triple then
										sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00}, ���� {FFFFFF}/flink", main_color)
									end
									sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
									if flinke.cfg.checksound then
										lua_thread.create(function()
											while true do
												wait(0)
												addOneOffSound(0.0, 0.0, 0.0, 1137)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1138)
												wait(100)
												addOneOffSound(0.0, 0.0, 0.0, 1139)
												break
											end
										end)
									end
								elseif flinke.cfg.cimgui then
									newssilkaa = true
									newssilkatime()
								end
							end
						end
					end
				end
			end
		end
		naideno = false
	end
end

function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowPadding = imgui.ImVec2(8.0, 4.0)
	style.WindowRounding = 16.0
	style.ChildWindowRounding = 6.0
	style.FramePadding = imgui.ImVec2(4.0, 3.0)
	style.FrameRounding = 12.0
	style.ItemSpacing = imgui.ImVec2(12.0, 6.5)
	style.ItemInnerSpacing = imgui.ImVec2(4.0, 4.0)
	style.TouchExtraPadding = imgui.ImVec2(0, 0)
	style.IndentSpacing = 0
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 12.0
	style.GrabMinSize = 20.0
	style.GrabRounding = 16.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ButtonTextAlign = imgui.ImVec2(0.5, 0.15)

	if theme == 1 then
		colors[clr.Text]                   = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00)
		colors[clr.WindowBg]               = ImVec4(1.00, 1.00, 1.00, 0.95)
		colors[clr.ChildWindowBg]          = ImVec4(0.22, 0.22, 0.22, 0.00)
		colors[clr.PopupBg]                = ImVec4(0.83, 0.83, 0.83, 0.84)
		colors[clr.Border]                 = ImVec4(0.00, 0.00, 0.00, 0.40)
		colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.00)
		colors[clr.FrameBg]                = ImVec4(0.00, 0.00, 0.00, 0.30)
		colors[clr.FrameBgHovered]         = ImVec4(0.62, 0.62, 0.62, 0.40)
		colors[clr.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.46)
		colors[clr.TitleBg]                = ImVec4(a1, b1, c1, 0.83)
		colors[clr.TitleBgActive]          = ImVec4(a1, b1, c1, 0.87)
		colors[clr.TitleBgCollapsed]       = ImVec4(a1, b1, c1, 0.20)
		colors[clr.MenuBarBg]              = ImVec4(1.00, 1.00, 1.00, 0.80)
		colors[clr.ScrollbarBg]            = ImVec4(0.34, 0.72, 1.00, 0.60)
		colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.00, 1.00, 0.30)
		colors[clr.ScrollbarGrabHovered]   = ImVec4(0.05, 0.00, 1.00, 1.00)
		colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 0.26, 1.00, 0.40)
		colors[clr.ComboBg]                = ImVec4(1.00, 1.00, 1.00, 0.99)
		colors[clr.CheckMark]              = ImVec4(a1, b1, c1, 0.97)
		colors[clr.SliderGrab]             = ImVec4(0.00, 0.29, 1.00, 0.76)
		colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.45, 1.00, 0.99)
		colors[clr.Button]                 = ImVec4(a1, b1, c1, 0.7)
		colors[clr.ButtonHovered]          = ImVec4(a1, b1, c1, 1.00)
		colors[clr.ButtonActive]           = ImVec4(a1, b1, c1, 0.5)
		colors[clr.Header]                 = ImVec4(0.06, 0.55, 0.87, 0.70)
		colors[clr.HeaderHovered]          = ImVec4(0.03, 0.21, 0.95, 0.46)
		colors[clr.HeaderActive]           = ImVec4(0.05, 0.05, 0.69, 0.80)
		colors[clr.Separator]              = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.SeparatorHovered]       = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.SeparatorActive]        = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.ResizeGrip]             = ImVec4(1.00, 1.00, 1.00, 0.30)
		colors[clr.ResizeGripHovered]      = ImVec4(1.00, 1.00, 1.00, 0.60)
		colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 0.90)
		colors[clr.CloseButton]            = ImVec4(0.69, 0.00, 0.00, 0.83)
		colors[clr.CloseButtonHovered]     = ImVec4(0.72, 0.00, 0.00, 0.79)
		colors[clr.CloseButtonActive]      = ImVec4(1.00, 0.00, 0.00, 1.00)
		colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.PlotLinesHovered]       = ImVec4(0.90, 0.70, 0.00, 1.00)
		colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
		colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
		colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.00, 0.00, 0.35)
		colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35)
	elseif theme == 2 then
		colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
		colors[clr.WindowBg]               = ImVec4(0.00, 0.00, 0.00, 0.95)
		colors[clr.ChildWindowBg]          = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.PopupBg]                = ImVec4(0.35, 0.35, 0.35, 0.80)
		colors[clr.Border]                 = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.FrameBg]                = ImVec4(0.80, 0.80, 0.80, 0.30)
		colors[clr.FrameBgHovered]         = ImVec4(1.00, 1.00, 1.00, 0.53)
		colors[clr.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.41)
		colors[clr.TitleBg]                = ImVec4(a1, b1, c1, 1.00)
		colors[clr.TitleBgActive]          = ImVec4(a1, b1, c1, 1.00)
		colors[clr.TitleBgCollapsed]       = ImVec4(a1, b1, c1, 0.35)
		colors[clr.MenuBarBg]              = ImVec4(1.00, 1.00, 1.00, 0.41)
		colors[clr.ScrollbarBg]            = ImVec4(0.00, 0.00, 0.00, 0.70)
		colors[clr.ScrollbarGrab]          = ImVec4(1.00, 1.00, 1.00, 0.78)
		colors[clr.ScrollbarGrabHovered]   = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.ScrollbarGrabActive]    = ImVec4(1.00, 1.00, 1.00, 0.43)
		colors[clr.ComboBg]                = ImVec4(0.03, 0.03, 0.03, 0.99)
		colors[clr.CheckMark]              = ImVec4(a1, b1, c1, 1.00)
		colors[clr.SliderGrab]             = ImVec4(1.00, 1.00, 1.00, 0.54)
		colors[clr.SliderGrabActive]       = ImVec4(1.00, 1.00, 1.00, 0.80)
		colors[clr.Button]                 = ImVec4(a1, b1, c1, 0.7)
		colors[clr.ButtonHovered]          = ImVec4(a1, b1, c1, 1.00)
		colors[clr.ButtonActive]           = ImVec4(a1, b1, c1, 0.5)
		colors[clr.Header]                 = ImVec4(1.00, 1.00, 1.00, 0.08)
		colors[clr.HeaderHovered]          = ImVec4(0.99, 0.99, 1.00, 0.34)
		colors[clr.HeaderActive]           = ImVec4(1.00, 1.00, 1.00, 0.74)
		colors[clr.Separator]              = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.ResizeGrip]             = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.ResizeGripHovered]      = ImVec4(1.00, 1.00, 1.00, 0.60)
		colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.CloseButton]            = ImVec4(0.69, 0.00, 0.00, 0.83)
		colors[clr.CloseButtonHovered]     = ImVec4(0.72, 0.00, 0.00, 0.79)
		colors[clr.CloseButtonActive]      = ImVec4(1.00, 0.00, 0.00, 1.00)
		colors[clr.PlotLines]              = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.PlotLinesHovered]       = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.PlotHistogram]          = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.00, 0.00, 0.35)
		colors[clr.ModalWindowDarkening]   = ImVec4(0.00, 0.00, 0.00, 0.35)
	end
end

function imgui.CustomButton(name, color, colorHovered, colorActive, size)
	local clr = imgui.Col
	imgui.PushStyleColor(clr.Button, color)
	imgui.PushStyleColor(clr.ButtonHovered, colorHovered)
	imgui.PushStyleColor(clr.ButtonActive, colorActive)
	if not size then size = imgui.ImVec2(0, 0) end
	local result = imgui.Button(name, size)
	imgui.PopStyleColor(3)
	return result
end

function imgui.TextColoredRGB(text)
	local style = imgui.GetStyle()
	local colors = style.Colors
	local ImVec4 = imgui.ImVec4

	local explode_argb = function(argb)
		local a = bit.band(bit.rshift(argb, 24), 0xFF)
		local r = bit.band(bit.rshift(argb, 16), 0xFF)
		local g = bit.band(bit.rshift(argb, 8), 0xFF)
		local b = bit.band(argb, 0xFF)
		return a, r, g, b
	end

	local getcolor = function(color)
		if color:sub(1, 6):upper() == 'SSSSSS' then
			local r, g, b = colors[1].x, colors[1].y, colors[1].z
			local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
			return ImVec4(r, g, b, a / 255)
		end
		local color = type(color) == 'string' and tonumber(color, 16) or color
		if type(color) ~= 'number' then return end
		local r, g, b, a = explode_argb(color)
		return imgui.ImColor(r, g, b, a):GetVec4()
	end

	local render_text = function(text_)
		for w in text_:gmatch('[^\r\n]+') do
			local text, colors_, m = {}, {}, 1
			w = w:gsub('{(......)}', '{%1FF}')
			while w:find('{........}') do
				local n, k = w:find('{........}')
				local color = getcolor(w:sub(n + 1, k - 1))
				if color then
					text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
					colors_[#colors_ + 1] = color
					m = n
				end
				w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
			end
			if text[0] then
				for i = 0, #text do
					imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
					imgui.SameLine(nil, 0)
				end
				imgui.NewLine()
			else imgui.Text(u8(w)) end
		end
	end

	render_text(text)
end

function imgui.TextColoredRGBCenter(text)
	local style = imgui.GetStyle()
	local colors = style.Colors
	local ImVec4 = imgui.ImVec4

	local width = imgui.GetWindowWidth()
	local height = imgui.GetWindowHeight()
	local calc = imgui.CalcTextSize(text)
	imgui.SetCursorPosX( width / 2 - calc.x / 2 - 125 )
	imgui.SetCursorPosY( height / 2 - calc.y / 2 )

	local explode_argb = function(argb)
		local a = bit.band(bit.rshift(argb, 24), 0xFF)
		local r = bit.band(bit.rshift(argb, 16), 0xFF)
		local g = bit.band(bit.rshift(argb, 8), 0xFF)
		local b = bit.band(argb, 0xFF)
		return a, r, g, b
	end

	local getcolor = function(color)
		if color:sub(1, 6):upper() == 'SSSSSS' then
			local r, g, b = colors[1].x, colors[1].y, colors[1].z
			local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
			return ImVec4(r, g, b, a / 255)
		end
		local color = type(color) == 'string' and tonumber(color, 16) or color
		if type(color) ~= 'number' then return end
		local r, g, b, a = explode_argb(color)
		return imgui.ImColor(r, g, b, a):GetVec4()
	end

	local render_text = function(text_)
		for w in text_:gmatch('[^\r\n]+') do
			local text, colors_, m = {}, {}, 1
			w = w:gsub('{(......)}', '{%1FF}')
			while w:find('{........}') do
				local n, k = w:find('{........}')
				local color = getcolor(w:sub(n + 1, k - 1))
				if color then
					text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
					colors_[#colors_ + 1] = color
					m = n
				end
				w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
			end
			if text[0] then
				for i = 0, #text do
					imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
					imgui.SameLine(nil, 0)
				end
				imgui.NewLine()
			else imgui.Text(u8(w)) end
		end
	end

	render_text(text)
end

function imgui.CenterText(text)
	local width = imgui.GetWindowWidth()
	local calc = imgui.CalcTextSize(text)
	imgui.SetCursorPosX( width / 2 - calc.x / 2 )
	imgui.Text(text)
end

function imgui.CenterTextDisabled(text)
	local width = imgui.GetWindowWidth()
	local calc = imgui.CalcTextSize(text)
	imgui.SetCursorPosX( width / 2 - calc.x / 2 )
	imgui.TextDisabled(text)
end

function imgui.TextQuestion(text)
	imgui.TextDisabled('(?)')
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(550)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end

function join_argb(a, r, g, b)
	local argb = b  -- b
	argb = bit.bor(argb, bit.lshift(g, 8))  -- g
	argb = bit.bor(argb, bit.lshift(r, 16)) -- r
	argb = bit.bor(argb, bit.lshift(a, 24)) -- a
	return argb
end

local clor = join_argb(0, a1 * 255, b1 * 255, c1 * 255)
d1 = ('%06X'):format(clor)
d1 = "{" .. d1 .. "}"

function imgui.VerticalSeparator()
	local p = imgui.GetCursorScreenPos()
	imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x, p.y + imgui.GetContentRegionMax().y - 33), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.Separator]))
end

function imgui.BeforeDrawFrame()
	if fa_font == nil then
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize40 == nil then
		fontsize40 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 40.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize20 == nil then
		fontsize20 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 20.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize30 == nil then
		fontsize30 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 30.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize35 == nil then
		fontsize35 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 35.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize25 == nil then
		fontsize25 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 25.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize18 == nil then
		fontsize18 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 18.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 15.0, font_config, fa_glyph_ranges)
	end
end 

function imgui.OnDrawFrame()
	apply_custom_style()
	if main_window.v then
		imgui.ShowCursor = true
		imgui.SetNextWindowSize(imgui.ImVec2(1600, 363), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2 - 800, sh / 2 - 181.5))
		imgui.Begin(u8"FastLink", main_window, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoScrollWithMouse)
		imgui.PushFont(fontsize25)
		imgui.Spacing()
		imgui.BeginChild("Select", imgui.ImVec2(367, 334))
			if menuSelected == 1 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_LINK .. u8" ���������� ������", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_LINK .. u8" ���������� ������", imgui.ImVec2(355, 35)) then
					menuSelected = 1
				end
			end
			if menuSelected == 2 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_COG .. u8" ��������� ��������� ������", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_COG .. u8" ��������� ��������� ������", imgui.ImVec2(355, 35)) then
					menuSelected = 2
				end
			end
			if menuSelected == 3 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_KEYBOARD .. u8" ��������� �����", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_KEYBOARD .. u8" ��������� �����", imgui.ImVec2(355, 35)) then
					menuSelected = 3
				end
			end
			if menuSelected == 4 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_BAN .. u8" ������� ������������� ������", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_BAN .. u8" ������� ������������� ������", imgui.ImVec2(355, 35)) then
					menuSelected = 4
				end
			end
			if menuSelected == 5 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_PALETTE .. u8" ������������ ����������", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_PALETTE .. u8" ������������ ����������", imgui.ImVec2(355, 35)) then
					menuSelected = 5
				end
			end
			if menuSelected == 6 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_FOLDER_PLUS .. u8" ����������", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_FOLDER_PLUS .. u8" ����������", imgui.ImVec2(355, 35)) then
					menuSelected = 6
				end
			end
			if menuSelected == 7 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_INFO_CIRCLE .. u8" ���������� � �������", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_INFO_CIRCLE .. u8" ���������� � �������", imgui.ImVec2(355, 35)) then
					menuSelected = 7
				end
			end
			if theme == 1 then
				local style = imgui.GetStyle()
				local colors = style.Colors
				local clr = imgui.Col
				local ImVec4 = imgui.ImVec4
				colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
				if imgui.CustomButton(fa.ICON_FA_BRUSH .. u8" ������� �� ����� ����", imgui.ImVec4(0.00, 0.00, 0.00, 0.95),  imgui.ImVec4(0.00, 0.00, 0.00, 1.00), imgui.ImVec4(0.00, 0.00, 0.00, 0.8), imgui.ImVec2(355, 35))  then
					theme = 2
					flinke.cfg.theme = theme
					inicfg.save(flinke, "flinke")
				end
				colors[clr.Text] = ImVec4(0.00, 0.00, 0.00, 1.00)
			elseif theme == 2 then
				local style = imgui.GetStyle()
				local colors = style.Colors
				local clr = imgui.Col
				local ImVec4 = imgui.ImVec4
				colors[clr.Text] = ImVec4(0.00, 0.00, 0.00, 1.00)
				if imgui.CustomButton(fa.ICON_FA_BRUSH .. u8" ������� �� ������� ����", imgui.ImVec4(1.00, 1.00, 1.00, 0.8),  imgui.ImVec4(1.00, 1.00, 1.00, 1.00), imgui.ImVec4(1.00, 1.00, 1.00, 0.40), imgui.ImVec2(355, 35))  then
					theme = 1
					flinke.cfg.theme = theme
					inicfg.save(flinke, "flinke")
				end
				colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
			end
			imgui.Spacing()
		imgui.EndChild()
		imgui.PopFont()
		imgui.SameLine()
		imgui.VerticalSeparator()
		imgui.Spacing()
		if menuSelected == 1 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("Links", imgui.ImVec2(1183, 90), true, imgui.WindowFlags.NoScrollbar)
			if ssilka ~= nil then
				imgui.PushFont(fontsize20)
					ssilka = ssilka:gsub('{......}', '')
					if theme == 1 then
						imgui.TextColoredRGB("{003399}������ {000000}\"{355e3b}" .. ssilka .. "{000000}\"{003399}, ���� �������� � {9400d3}" .. time1 .. " {003399}|")
					elseif theme == 2 then
						imgui.TextColoredRGB("{003399}������ {FFFFFF}\"{355e3b}" .. ssilka .. "{FFFFFF}\"{003399}, ���� �������� � {9400d3}" .. time1 .. " {003399}|")
					end
					imgui.SameLine()
				imgui.PopFont()
				imgui.PushFont(fontsize18)
					if imgui.Button(fa.ICON_FA_GLOBE .. u8" ������� ##3", imgui.ImVec2(90, 23)) then
						os.execute("start " .. ssilka)
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ������...", main_color)
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_COPY .. u8" ����������� ##3", imgui.ImVec2(115, 23)) then
						setClipboardText(ssilka)
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}����������� {FFFF00}� ����� ������", main_color)
					end
				imgui.PopFont()
			end
			if ssilka2 ~= nil then
				imgui.PushFont(fontsize20)
					ssilka2 = ssilka2:gsub('{......}', '')
					if theme == 1 then
						imgui.TextColoredRGB("{003399}������ {000000}\"{355e3b}" .. ssilka2 .. "{000000}\"{003399}, ���� �������� � {9400d3}" .. time2 .. " {003399}|")
					elseif theme == 2 then
						imgui.TextColoredRGB("{003399}������ {FFFFFF}\"{355e3b}" .. ssilka2 .. "{FFFFFF}\"{003399}, ���� �������� � {9400d3}" .. time2 .. " {003399}|")
					end
					imgui.SameLine()
				imgui.PopFont()
				imgui.PushFont(fontsize18)
					if imgui.Button(fa.ICON_FA_GLOBE .. u8" ������� ##2", imgui.ImVec2(90, 23)) then
						os.execute("start " .. ssilka2)
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ������...", main_color)
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_COPY .. u8" ����������� ##2", imgui.ImVec2(115, 23)) then
						setClipboardText(ssilka2)
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}����������� {FFFF00}� ����� ������", main_color)
					end
				imgui.PopFont()
			end
			if ssilka3 ~= nil then
				imgui.PushFont(fontsize20)
					ssilka3 = ssilka3:gsub('{......}', '')
					if theme == 1 then
						imgui.TextColoredRGB("{003399}������ {000000}\"{355e3b}" .. ssilka3 .. "{000000}\"{003399}, ���� �������� � {9400d3}" .. time3 .. " {003399}|")
					elseif theme == 2 then
						imgui.TextColoredRGB("{003399}������ {FFFFFF}\"{355e3b}" .. ssilka3 .. "{FFFFFF}\"{003399}, ���� �������� � {9400d3}" .. time3 .. " {003399}|")
					end
					imgui.SameLine()
				imgui.PopFont()
				imgui.PushFont(fontsize18)
					if imgui.Button(fa.ICON_FA_GLOBE .. u8" ������� ##1", imgui.ImVec2(90, 23)) then
						os.execute("start " .. ssilka3)
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ������...", main_color)
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_COPY .. u8" ����������� ##1", imgui.ImVec2(115, 23)) then
						setClipboardText(ssilka3)
						sampAddChatMessage(tag .. color_text .. "{FFFFFF}����������� {FFFF00}� ����� ������", main_color)
					end
				imgui.PopFont()
			end
			if ssilka == nil and ssilka2 == nil and ssilka3 == nil then
				imgui.PushFont(fontsize40)
					imgui.TextColoredRGBCenter("{FF0000}� ���� �� ���� ������� �� ����� ������!")
				imgui.PopFont()
			end
			imgui.EndChild()
		end
		if menuSelected == 2 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("Params", imgui.ImVec2(1183, 323), true, imgui.WindowFlags.NoScrollbar)
				if work then
					imgui.PushFont(fontsize25)
						if imgui.Button(fa.ICON_FA_POWER_OFF .. u8" ��������� ����� ������ � ����", imgui.ImVec2(1168, 35)) then
							work = false
						end
					imgui.PopFont()
				else
					imgui.PushFont(fontsize25)
						if imgui.Button(fa.ICON_FA_TOGGLE_ON .. u8" �������� ����� ������ � ����", imgui.ImVec2(1168, 35)) then
							work = true
						end
					imgui.PopFont()
				end
				imgui.PushFont(fontsize25)
					imgui.TextColoredRGB("{003399}���������� {355e3b}��������� {003399}������ �����...")
					imgui.SameLine()
					imgui.Spacing()
					imgui.Spacing()
				imgui.PopFont()
				imgui.PushFont(fontsize20)
					if imgui.RadioButton(u8"���", radio, 1) then
						flinke.cfg.cimgui = false
						flinke.cfg.cchat = true
						inicfg.save(flinke, "flinke")
					end
					if imgui.RadioButton(u8"�������������� ��������� ImGui ����", radio, 2) then
						flinke.cfg.cimgui = true
						flinke.cfg.cchat = false
						inicfg.save(flinke, "flinke")
					end
				imgui.PopFont()
				imgui.PushFont(fontsize25)
					if flinke.cfg.cimgui then
						if imgui.Button(fa.ICON_FA_ARROWS_ALT .. u8" �������� �������������� ���. ���� �� ������", imgui.ImVec2(578, 35)) then
							fcp()
						end
						imgui.SameLine()
						if imgui.Button(fa.ICON_FA_EJECT .. u8" �������� �������������� ���. ���� �� ������", imgui.ImVec2(578, 35)) then
							fcr()
						end
					end
					if imgui.Button(fa.ICON_FA_COMMENT .. u8" ��������� ����� ������", imgui.ImVec2(1168, 35)) then
						if flinke.cfg.cchat then
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: �������{FFFFFF} F2{FFFF00}, ���� ������� {FFFFFF}/flink", main_color)
							sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}example-link.com/2281337", main_color)
						elseif flinke.cfg.cimgui then
							examplee()
						end
					end
				imgui.PopFont()
				imgui.PushFont(fontsize20)
					imgui.Spacing()
					imgui.Spacing()
					imgui.SameLine()
					imgui.Separator()
					imgui.Spacing()
					if imgui.Checkbox(u8" - ��������������� ���� ����� ������ ���� �������", check_sound) then
						flinke.cfg.checksound = check_sound.v
						inicfg.save(flinke, "flinke")
					end
					imgui.SameLine()
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 3 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("Bind", imgui.ImVec2(1183, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize20)
					if imgui.HotKey("##1", activeKeys, tLastKeys, 120) then
						rkeys.changeHotKey(bindKey, activeKeys.v)
						flinke.cfg.bindKey = encodeJson(activeKeys.v)
						inicfg.save(flinke, "flinke")
					end
					imgui.SameLine()
					imgui.Text(u8"- �������� ������� �������� �� �������")
				imgui.PopFont()
				imgui.Separator()
				imgui.PushFont(fontsize25)
					imgui.TextColoredRGB("{003399}������������ {355e3b}������� {003399}����...")
				imgui.PopFont()
				imgui.PushFont(fontsize20)
					if imgui.Checkbox(u8"- ������� ���� ����;", check_chat) then
						flinke.cfg.chatIgnore = check_chat.v
						inicfg.save(flinke, "flinke")
					end
					if imgui.Checkbox(u8"- ������ ���;", check_tab) then
						flinke.cfg.tabIgnore = check_tab.v
						inicfg.save(flinke, "flinke")
					end
					if imgui.Checkbox(u8"- ������� ������� ���������;", check_console) then
						flinke.cfg.consoleIgnore = check_console.v
						inicfg.save(flinke, "flinke")
					end
					if imgui.Checkbox(u8"- ������� ���������� ����", check_dialog) then
						flinke.cfg.dialogIgnore = check_dialog.v
						inicfg.save(flinke, "flinke")
					end
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 4 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("IgnoreLinks", imgui.ImVec2(1183, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize20)
					imgui.PushItemWidth(600)
					if imgui.InputText(u8"��������� �������������", local_text) then
						local_text.v = local_text.v:gsub(' ', '')
					end
					imgui.PopItemWidth()
					imgui.SameLine()
					imgui.TextQuestion(u8"������ ������� �������� �� ��������� ������������� ������...\n����� ������ ������ ����� ������������ ������ ����������� ������, ������:\nexample-link.com/2281337/\nexample-link.net/123/")
					imgui.SameLine()
					imgui.TextDisabled(u8"- ������ ������ �� ��������")
				imgui.PopFont()
				imgui.PushFont(fontsize25)
					if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" �������� ������ � ��������� �������������", imgui.ImVec2(578, 35)) then
						if #local_text.v == 0 then
							sampAddChatMessage(tag .. color_text .. "���� ��� ����� {FFFFFF}������", main_color)
						else
							local i = 1
							for _,v in ipairs(l) do
								if local_text.v:match("%S+%." .. v .. "/%S+") then
									if local_text.v:match("https://%S+%." .. v .. "/%S+") then
										local asdasd1, asdasd2 = local_text.v:match("https://(%S+)%." .. v .. "(/%S+)")
										local_text.v = asdasd1 .. "." .. v .. asdasd2
									elseif local_text.v:match("http://%S+%." .. v .. "/%S+") then
										local asdasd1, asdasd2 = local_text.v:match("http://(%S+)%." .. v .. "(/%S+)")
										local_text.v = asdasd1 .. "." .. v .. asdasd2
									elseif local_text.v:match("www%.%S+%." .. v .. "/%S+") then
										local asdasd1, asdasd2 = local_text.v:match("www%.(%S+)%." .. v .. "(/%S+)")
										local_text.v = asdasd1 .. "." .. v .. asdasd2
									end
									addtoignorelocal()
									break
								else
									i = i + 1
									if i == 275 then
										sampAddChatMessage(tag .. color_text .. "������������ {FFFFFF}������{FFFF00}!", main_color)
										break
									end
								end
							end
						end
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" ������� ������ �� ���������� �������������", imgui.ImVec2(578, 35)) then
						deleteignorelinklocal()
					end
					if imgui.Button(fa.ICON_FA_EYE .. u8" ���������� ��� ������ � ��������� �������������", imgui.ImVec2(1168, 35)) then
						showignorelocal()
					end
				imgui.PopFont()
				imgui.PushFont(fontsize20)
					imgui.PushItemWidth(600)
						if imgui.InputText(u8"���������� �������������", global_text) then
							global_text.v = global_text.v:gsub(' ', '')
						end
					imgui.PopItemWidth()
					imgui.SameLine()
					imgui.TextQuestion(u8"������ ������� �������� �� ���������� ������������� ������...\n����� ������ ������ ����� ������������ ��� ������, ������:\nexample-link.com\nexample-link.net")
					imgui.SameLine()
					imgui.TextDisabled(u8"- ������ ������ �� ��������")
				imgui.PopFont()
				imgui.PushFont(fontsize25)
					if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" �������� ������ � ���������� �������������", imgui.ImVec2(578, 35)) then
						if #global_text.v == 0 then
							sampAddChatMessage(tag .. color_text .. "���� ��� ����� {FFFFFF}������", main_color)
						else
							local i = 1
							for _,v in ipairs(l) do
								if global_text.v:match("%S+%." .. v) then
									if not global_text.v:match("%S+%." .. v .. "%S+") then
										if global_text.v:match("https://%S+%." .. v) then
											local asdasd = global_text.v:match("https://(%S+)%." .. v)
											global_text.v = asdasd .. "." .. v
										elseif global_text.v:match("http://%S+%." .. v) then
											local asdasd = global_text.v:match("http://(%S+)%." .. v)
											global_text.v = asdasd .. "." .. v
										elseif global_text.v:match("www%.%S+%." .. v) then
											local asdasd = global_text.v:match("www%.(%S+)%." .. v)
											global_text.v = asdasd .. "." .. v
										end
										addtoignoreglobal()
										break
									else
										i = i + 1
										if i == 275 then
											sampAddChatMessage(tag .. color_text .. "������������ {FFFFFF}������{FFFF00}!", main_color)
											break
										end
									end
								else
									i = i + 1
									if i == 275 then
										sampAddChatMessage(tag .. color_text .. "������������ {FFFFFF}������{FFFF00}!", main_color)
										break
									end
								end
							end
						end
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" ������� ������ �� ����������� �������������", imgui.ImVec2(578, 35)) then
						deleteignorelinkglobal()
					end
					if imgui.Button(fa.ICON_FA_EYE .. u8" ���������� ��� ������ � ���������� �������������", imgui.ImVec2(1168, 35)) then
						showignoreglobal()
					end
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
					if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" ������� ��� ������ �� ���������� �������������", imgui.ImVec2(578, 35)) then
						deletealllocal()
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" ������� ��� ������ �� ����������� �������������", imgui.ImVec2(578, 35)) then
						deleteallglobal()
					end
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 5 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("Customization", imgui.ImVec2(1183, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize20)
					imgui.PushItemWidth(400)
					if imgui.ColorEdit3(u8'- �������� ���� �����', color) then
						local clr = join_argb(0, color.v[1] * 255, color.v[2] * 255, color.v[3] * 255)
						a1 = string.format('%.2f', color.v[1])
						b1 = string.format('%.2f', color.v[2])
						c1 = string.format('%.2f', color.v[3])
						d1 = ('%06X'):format(clr)
						d1 = "{" .. d1 .. "}"
						changeColor = true
						local style = imgui.GetStyle()
						local colors = style.Colors
						local clr = imgui.Col
						local ImVec4 = imgui.ImVec4
						colors[clr.CheckMark] = ImVec4(a1, b1, c1, 0.97)
					end
					imgui.PopItemWidth()
				imgui.PopFont()
				imgui.PushFont(fontsize25)
					if imgui.Button(fa.ICON_FA_SAVE .. u8" ��������� ����� ����� � ������", imgui.ImVec2(1168, 35)) then
						if changeColor then
							sampAddChatMessage(tag .. color_text .. "����� " .. d1 .. "����� {FFFF00}������� {FFFFFF}�������� {FFFF00}� ������", main_color)
							flinke.cfg.color1 = a1
							flinke.cfg.color2 = b1
							flinke.cfg.color3 = c1
							inicfg.save(flinke, "flinke")
						else
							sampAddChatMessage(tag .. color_text .. "������� ���������� {FFFFFF}�������� {FFFF00}����", main_color)
						end
					end
					if imgui.Button(fa.ICON_FA_EJECT .. u8" �������� �� ����� �� ���������", imgui.ImVec2(1168, 35)) then
						sampAddChatMessage(tag .. color_text .. "����� ������� �� ��������� �� ��������� �{FFFF00} ������� {FFFFFF}�������� {FFFF00}� ������", main_color)
						flinke.cfg.color1 = 0.00
						flinke.cfg.color2 = 0.49
						flinke.cfg.color3 = 1.00
						a1 = 0.00
						b1 = 0.49
						c1 = 1.00
						local clr = join_argb(0, a1 * 255, b1 * 255, c1 * 255)
						d1 = ('%06X'):format(clr)
						d1 = "{" .. d1 .. "}"
						color = imgui.ImFloat3(a1, b1, c1)
						inicfg.save(flinke, "flinke")
					end
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 6 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("UpdateMN", imgui.ImVec2(1183, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize25)
					if imgui.Button(fa.ICON_FA_CLOUD_UPLOAD_ALT .. u8" ��������� ������� ����������", imgui.ImVec2(1168, 35)) then
						updcheck()
					end
					if imgui.Button(fa.ICON_FA_DOWNLOAD .. u8" ��������", imgui.ImVec2(1168, 35)) then
						upd()
					end
					if imgui.Button(fa.ICON_FA_HISTORY .. u8" ������� ����������", imgui.ImVec2(1168, 35)) then
						history()
					end
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 7 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("InfoOfScript", imgui.ImVec2(1183, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize20)
					if theme == 1 then
						if page == 1 then
							imgui.TextColoredRGB("" .. d1 .. "������ {000000}FastLink " .. d1 .. "��� ������ ��� ������� ����� ������ �� ���� � ��� �������� �������� �� ���. " .. d1 .. "��� ������ � ���� �������� ������ ������ � ������� \n{000000}https://������" .. d1 .. " ���� {000000}http://������" .. d1 .. ", ������ {000000}�������� " .. d1 .. "����������� ��������� � {000000}��������� " .. d1 .. "������� �� ��������� ������. ��� �� ������ �����\n" .. d1 .. "������������ � �� ������� �������� ������ �� ���� {000000}google.com/123/" .. d1 .. ", �� ������ ������� ���������, ������ ���:\n{000000}." .. table.concat(l,", .", 1, 25) .. "\n{000000}." .. table.concat(l,", .", 26, 58) .. "\n{000000}." .. table.concat(l,", .", 58, 91) .. "\n{000000}." .. table.concat(l,", .", 92, 126) .. "\n{000000}." .. table.concat(l,", .", 127, 162) .. "\n{000000}." .. table.concat(l,", .", 163, 195) .. "\n{000000}." .. table.concat(l,", .", 196, 230) .. "\n{000000}." .. table.concat(l,", .", 231, 264) .. "\n{000000}." .. table.concat(l,", .", 265, 274))
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_FORWARD .. u8" ��������� ��������", imgui.ImVec2(205, 25)) then
								page = 2
							end
						elseif page == 2 then
							imgui.TextColoredRGB("" .. d1 .. "����� ������ ���������/����� ����������� ������ � ���� (�� ��������� ���), ���������� ������ �������: {000000}/flinkwork\n" .. d1 .. "����� ��������� ������� {000000}����������" .. d1 .. " �������, ���������� ������ {000000}/flinkupdcheck\n" .. d1 .. "����� ������� ������� {000000}����������" .. d1 .. " �������, ���������� ������ {000000}/flinkupdhistory\n" .. d1 .. "� ������� ������� ����� ���� � ����� {000000}���������� " .. d1 .. "���������� ��������. ��� ��������� ����: {000000}/flinkmn\n" .. d1 .. "����� �������: {000000}https://vk.com/klamet1/" .. d1 .. ". ���� �� ����� ����� ���� {000000}���" .. d1 .. ", ������ ������ ��������\n{000000}�������������" .. d1 .. " ��� �������� ����� ���� {000000}������" .. d1 .. ", �� ������ ��� ������� �� {000000}���������\n" .. d1 .. "����� ����� ��������� � {000000}������������ �������������" .. d1 .. ". �� ������ �������� ������� ������� �� ��� {000000}QIWI\n" .. d1 .. "������� �� {000000}��������" .. d1 .. ", ��� ������� � {000000}QIWI" .. d1 .. " ��������: {000000}HADIV201" .. d1 .. ".\n{000000}������� " .. d1 .. "�� ������������� ����� �������. {000000}�������" .. d1 .. ", ��� ������ ������ ����� ����� ������ ������.")
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_BACKWARD .. u8" ���������� ��������", imgui.ImVec2(205, 25)) then
								page = 1
							end
						end
					elseif theme == 2 then
						if page == 1 then
							imgui.TextColoredRGB("" .. d1 .. "������ {FFFFFF}FastLink " .. d1 .. "��� ������ ��� ������� ����� ������ �� ���� � ��� �������� �������� �� ���. " .. d1 .. "��� ������ � ���� �������� ������ ������ � ������� \n{FFFFFF}https://������" .. d1 .. " ���� {FFFFFF}http://������" .. d1 .. ", ������ {FFFFFF}�������� " .. d1 .. "����������� ��������� � {FFFFFF}��������� " .. d1 .. "������� �� ��������� ������. ��� �� ������ �����\n" .. d1 .. "������������ � �� ������� �������� ������ �� ���� {FFFFFF}google.com/123/" .. d1 .. ", �� ������ ������� ���������, ������ ���:\n{FFFFFF}." .. table.concat(l,", .", 1, 25) .. "\n{FFFFFF}." .. table.concat(l,", .", 26, 58) .. "\n{FFFFFF}." .. table.concat(l,", .", 58, 91) .. "\n{FFFFFF}." .. table.concat(l,", .", 92, 126) .. "\n{FFFFFF}." .. table.concat(l,", .", 127, 162) .. "\n{FFFFFF}." .. table.concat(l,", .", 163, 195) .. "\n{FFFFFF}." .. table.concat(l,", .", 196, 230) .. "\n{FFFFFF}." .. table.concat(l,", .", 231, 264) .. "\n{FFFFFF}." .. table.concat(l,", .", 265, 274))
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_FORWARD .. u8" ��������� ��������", imgui.ImVec2(205, 25)) then
								page = 2
							end
						elseif page == 2 then
							imgui.TextColoredRGB("" .. d1 .. "����� ������ ���������/����� ����������� ������ � ���� (�� ��������� ���), ���������� ������ �������: {FFFFFF}/flinkwork\n" .. d1 .. "����� ��������� ������� {FFFFFF}����������" .. d1 .. " �������, ���������� ������ {FFFFFF}/flinkupdcheck\n" .. d1 .. "����� ������� ������� {FFFFFF}����������" .. d1 .. " �������, ���������� ������ {FFFFFF}/flinkupdhistory\n" .. d1 .. "� ������� ������� ����� ���� � ����� {FFFFFF}���������� " .. d1 .. "���������� ��������. ��� ��������� ����: {FFFFFF}/flinkmn\n" .. d1 .. "����� �������: {FFFFFF}https://vk.com/klamet1/" .. d1 .. ". ���� �� ����� ����� ���� {FFFFFF}���" .. d1 .. ", ������ ������ ��������\n{FFFFFF}�������������" .. d1 .. " ��� �������� ����� ���� {FFFFFF}������" .. d1 .. ", �� ������ ��� ������� �� {FFFFFF}���������\n" .. d1 .. "����� ����� ��������� � {FFFFFF}������������ �������������" .. d1 .. ". �� ������ �������� ������� ������� �� ��� {FFFFFF}QIWI\n" .. d1 .. "������� �� {FFFFFF}��������" .. d1 .. ", ��� ������� � {FFFFFF}QIWI" .. d1 .. " ��������: {FFFFFF}HADIV201" .. d1 .. ".\n{FFFFFF}������� " .. d1 .. "�� ������������� ����� �������. {FFFFFF}�������" .. d1 .. ", ��� ������ ������ ����� ����� ������ ������.")
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_BACKWARD.. u8" ���������� ��������", imgui.ImVec2(205, 25)) then
								page = 1
							end
						end
					end
				imgui.PopFont()
			imgui.EndChild()
		end
		imgui.End()
	end
	if two_window.v then
		apply_custom_style()
		if changepos then
			imgui.SetNextWindowPos(imgui.ImVec2(posx, posy))
			imgui.Begin(u8" FastLink ", nil, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.AlwaysAutoResize) 
			imgui.PushFont(fontsize20)
				imgui.TextColoredRGB("{003399}������� ����� ������...")
				imgui.TextColoredRGB("{355e3b}example-link.com/2281337")
				if oneKey then
					imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
				elseif double then
					imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
				elseif triple then
					imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
				end
			imgui.PopFont()
			imgui.End()
		end
		if example then
			imgui.SetNextWindowSize(imgui.ImVec2(350, 100), imgui.Cond.FirstUseEver)
			imgui.SetNextWindowPos(imgui.ImVec2(flinke.cfg.posx, flinke.cfg.posy))
			imgui.Begin(u8" FastLink ", nil, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.AlwaysAutoResize)
			imgui.PushFont(fontsize20)
				imgui.TextColoredRGB("{003399}������� ����� ������...")
				imgui.TextColoredRGB("{355e3b}example-link.com/2281337")
				if oneKey then
					imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
				elseif double then
					imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
				elseif triple then
					imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
				end
			imgui.PopFont()
			imgui.End()
		end
		if flinke.cfg.cimgui then
			if mojnavivod  then
				imgui.SetNextWindowSize(imgui.ImVec2(350, 90), imgui.Cond.FirstUseEver)
				imgui.SetNextWindowPos(imgui.ImVec2(flinke.cfg.posx, flinke.cfg.posy))
				imgui.Begin(u8" FastLink ", nil, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.AlwaysAutoResize)
				imgui.PushFont(fontsize20)
					imgui.TextColoredRGB("{003399}������� ����� ������...")
					imgui.TextColoredRGB("{355e3b}" .. vivodssilka)
					if oneKey then
						imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
					elseif double then
						imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
					elseif triple then
						imgui.TextColoredRGB("{003399}�������: ������� {355e3b}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{003399}, ���� ������� {355e3b}\"/flink\"")
					end
				imgui.PopFont()
				imgui.End()
			end
		end
	end
end