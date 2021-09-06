-- Author - https://vk.com/klamet1

require "lib.sampfuncs"
require "lib.moonloader"

script_name("FastLink")
script_author("СоМиК")
script_version("2.0")

local main_color = 0x5A90CE
local color_text = "{FFFF00}"
local tag = "[Fastlink]: "

local dlstatus = require('moonloader').download_status

local script_vers = 5
local script_vers_text = "2.0"
local script_path = thisScript().path
local script_url = "https://raw.githubusercontent.com/SoMiK3/FastLink/main/FastLink.lua"
local update_path = getWorkingDirectory() .. "/flinkupdate.ini"
local update_url = "https://raw.githubusercontent.com/SoMiK3/FastLink/main/flinkupdate.ini"

local MoonFolder = getWorkingDirectory()
local MoonLibFolder = MoonFolder .. "\\lib"
local samplua_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/events.lua"
local raknet_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/raknet.lua"
local utils_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/events/utils.lua"
local handlers_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/events/handlers.lua"
local extra_types_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/events/extra_types.lua"
local bitstream_io_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/events/bitstream_io.lua"
local vector3d_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/vector3d.lua"
local vkeys_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/vkeys.lua"
local eventscore_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/events_core.lua"
local core_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/samp/events/core.lua"
local imgui_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/imgui.lua"
local imguidll_url = "https://github.com/SoMiK3/FastLinkLibs/blob/main/MoonImGui.dll?raw=true"
nalichie = true

if not doesDirectoryExist("moonloader//lib") then
	createDirectory("moonloader//lib")
end
if not doesDirectoryExist("moonloader//lib//samp") then
	createDirectory("moonloader//lib//samp")
end
if not doesDirectoryExist("moonloader//lib//samp//events") then
	createDirectory("moonloader//lib//samp//events")
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
if not doesFileExist(MoonLibFolder .."\\vector3d.lua") then
	downloadUrlToFile(vector3d_url, MoonLibFolder .."\\vector3d.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\vkeys.lua") then
	downloadUrlToFile(vkeys_url, MoonLibFolder .."\\vkeys.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events_core.lua") then
	downloadUrlToFile(eventscore_url, MoonLibFolder .."\\samp\\events_core.lua")
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
if not doesFileExist(MoonLibFolder .."\\MoonImGui.dll") then
	downloadUrlToFile(imguidll_url, MoonLibFolder .."\\MoonImGui.dll")
	nalichie = false
	lua_thread.create(function()
		while true do
			wait(1000)
			if not nalichie then
				thisScript():reload()
				break
			end
		end
	end)
else
	lua_thread.create(function()
		while true do
			wait(1000)
			if not nalichie then
				thisScript():reload()
				break
			end
		end
	end)
end

local sampev = require "lib.samp.events"
local keys = require "vkeys"
local inicfg = require "inicfg"
local sw, sh = getScreenResolution()
local initable = {
cfg = {
	posx = 0,
	posy = sh / 2
	}
}
local flinke
local imgui = require "imgui"
local encoding = require "encoding"
encoding.default = "CP1251"
u8 = encoding.UTF8

local main_window = imgui.ImBool(false)
local text_buffer = imgui.ImBuffer(256)

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end

	if not doesDirectoryExist("moonloader//lib") then
		createDirectory("moonloader//lib")
		inicfg.save(initable, "flinke")
	end
	flinke = inicfg.load(nil, "flinke")
	if flinke == nil then
		inicfg.save(initable, "flinke")
		flinke = inicfg.load(nil, "flinke")
	end

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

	sampAddChatMessage(tag .. color_text .. "Скрипт готов к работе. Автор - " .. "{FFFFFF}" ..  "СоМиК" .. color_text .. "! Информация: " .. "{FFFFFF}" .. "/flinkinfo", main_color)
	sampAddChatMessage(tag .. color_text .. "Полезный скрипт для фарма виртов на {FFFFFF}ARZ RP(G) {FFFF00}от этого же автора: {FFFFFF}https://www.blast.hk/threads/98245/", main_color)
	sampAddChatMessage(tag .. color_text .. "Для перехода по ссылке {FFFFFF}https://www.blast.hk/threads/98245/{FFFF00} нажмите {FFFFFF}F3", main_color)

	downloadUrlToFile(update_url, update_path, function(id, status)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			checkupd = true
			updateIni = inicfg.load(nil, update_path)
			if tonumber(updateIni.info.vers) > script_vers then
				sampAddChatMessage(tag .. color_text .. "Есть {FFFFFF}обновление{FFFF00}! Новая версия: {FFFFFF}" .. updateIni.info.vers_text .."{FFFF00}. Текущая версия: {FFFFFF}".. script_vers_text .. "{FFFF00}.", main_color)
				sampAddChatMessage(tag .. color_text .. "Узнать изменения можно в группе скрипта во {FFFFFF}ВКонтакте{FFFF00}. Команда для перехода: {FFFFFF}/flinkupdinfo", main_color)
				sampAddChatMessage(tag .. color_text .. "Чтобы {FFFFFF}установить{FFFF00} обновление, необходимо ввести {FFFFFF}/flinkupd", main_color)
				mbobnova = true
				checkupd = false
			else
				checkupd = false
				sampAddChatMessage(tag .. color_text .. "Обновлений {FFFFFF}не найдено{FFFF00}. Проверить наличие обновлений повторно можно введя {FFFFFF}/flinkupdcheck", main_color)
			end
			os.remove(update_path)
			checkupd = false
		end
	end)

	if not doesDirectoryExist("moonloader//lib") then
		createDirectory("moonloader//lib")
		inicfg.save(initable, "flinke")
	end
	if flinke == nil then
		flinke = inicfg.load(nil, "flinke")
	end

	while true do
	wait(0)
		if isKeyJustPressed(0x71) and not isPauseMenuActive() and work == true then
			if abobus then
				sampAddChatMessage(tag .. color_text .. "{FFFFFF}Переходим {FFFF00}по последней найденной ссылке...", main_color)
				os.execute("start " .. ssilka)
			else
				sampAddChatMessage(tag .. color_text .. "Ссылка {FFFFFF}не найдена{FFFF00}. Дождитесь, пока в чате появится хотя бы одна ссылка.", main_color)
			end
		end
		if isKeyJustPressed(0x72) and not isPauseMenuActive() and work == true then
			sampAddChatMessage(tag .. color_text .. "{FFFFFF}Переходим {FFFF00}по ссылке...", main_color)
			os.execute("start https://www.blast.hk/threads/98245/")
		end
		if obnova then
			downloadUrlToFile(script_url, script_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					sampAddChatMessage(tag .. color_text .. "Обновление {FFFFFF}успешно{FFFF00} установлено. Новая версия: {FFFFFF}" .. updateIni.info.vers_text, main_color)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Узнать{FFFF00} историю обновлений можно, введя {FFFFFF}/flinkupdhistory", main_color)
				end
			end)
			break
		end
	end
end

function golink()
	if work then
		if abobus then
			sampAddChatMessage(tag .. color_text .. "{FFFFFF}Переходим {FFFF00}по последней найденной ссылке...", main_color)
			os.execute("start " .. ssilka)
		else
			sampAddChatMessage(tag .. color_text .. "Ссылка {FFFFFF}не найдена{FFFF00}. Дождитесь, пока в чате появится хотя бы одна ссылка.", main_color)
		end
	else
		sampAddChatMessage(tag .. color_text .. "Скрипт был {FFFFFF}отключён{FFFF00}. Для включения надо ввести команду {FFFFFF}/flinkwork", main_color)
	end
end

function work()
	if work then
		sampAddChatMessage(tag .. color_text .. "Скрипт {FFFFFF}отключён", main_color)
		work = false
	else
		sampAddChatMessage(tag .. color_text .. "Скрипт {FFFFFF}включён", main_color)
		work = true
	end
end

function info()
	sampAddChatMessage(tag .. color_text .. "Скрипт {FFFFFF}FastLink {FFFF00}был создан для удобной ловли ссылок из чата и для быстрого перехода по ним", main_color)
	sampAddChatMessage(tag .. color_text .. "Как только в чате появится полная ссылка в формате {FFFFFF}https://ссылка{FFFF00} либо {FFFFFF}http://ссылка{FFFF00}, скрипт", main_color)
	sampAddChatMessage(tag .. color_text .. "{FFFFFF}отправит {FFFF00}специальное сообщение и {FFFFFF}предложит {FFFF00}перейти по найденной ссылке. Так же скрипт может", main_color)
	sampAddChatMessage(tag .. color_text .. "среагировать и на обычные короткие ссылки по типу {FFFFFF}google.com/123/{FFFF00}, но список доменов ограничен, сейчас это:", main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 1, 19), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 20, 40), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 41, 61), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 62, 82), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 83, 103), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 104, 124), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 125, 145), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 146, 166), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 167, 187), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 188, 208), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 209, 229), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 230, 250), main_color)
	sampAddChatMessage(tag .. "{FFFFFF}." .. table.concat(l,", .", 251, 269), main_color)
	sampAddChatMessage(tag .. color_text .. "Чтобы скрипт прекратил/начал отлавливать ссылки в чате (по умолчанию вкл), достаточно ввести команду: {FFFFFF}/flinkwork", main_color)
	sampAddChatMessage(tag .. color_text .. "Чтобы проверить наличие {FFFFFF}обновлений{FFFF00} скрипта, достаточно ввести {FFFFFF}/flinkupdcheck", main_color)
	sampAddChatMessage(tag .. color_text .. "Чтобы открыть историю {FFFFFF}обновлений{FFFF00} скрипта, достаточно ввести {FFFFFF}/flinkupdhistory", main_color)
	sampAddChatMessage(tag .. color_text .. "В скрипте имеется имгуи окно с тремя {FFFFFF}последними {FFFF00}найденными ссылками. Для активации окна: {FFFFFF}/flinkmn", main_color)
end

function updinfo()
	os.execute("start https://vk.com/fastlink_samp")
	sampAddChatMessage(tag .. color_text .. "{FFFFFF}Переходим {FFFF00}по ссылке...", main_color)
end

function upd()
	if mbobnova then
		sampAddChatMessage(tag .. color_text .. "Начинаю {FFFFFF}устанавливать {FFFF00}найденное обновление", main_color)
		main_window.v = not main_window.v
		imgui.Process = main_window.v
		obnova = true
	else
		sampAddChatMessage(tag .. color_text .. "Обновлений {FFFFFF}не найдено{FFFF00}. Проверить наличие обновлений повторно можно введя {FFFFFF}/flinkupdcheck", main_color)
	end
end

function updcheck()
	if not checkupd then
		sampAddChatMessage(tag .. color_text .. "{FFFFFF}Проверяем {FFFF00}наличие обновлений...", main_color)
		downloadUrlToFile(update_url, update_path, function(id, status)
			if status == dlstatus.STATUS_ENDDOWNLOADDATA then
				checkupd = true
				updateIni = inicfg.load(nil, update_path)
				if tonumber(updateIni.info.vers) > script_vers then
					sampAddChatMessage(tag .. color_text .. "Есть {FFFFFF}обновление{FFFF00}! Новая версия: {FFFFFF}" .. updateIni.info.vers_text .. "{FFFF00}. Текущая версия: {FFFFFF}".. script_vers_text .. "{FFFF00}.", main_color)
					sampAddChatMessage(tag .. color_text .. "Узнать изменения можно в группе скрипта во {FFFFFF}ВКонтакте{FFFF00}. Команда для перехода: {FFFFFF}/flinkupdinfo", main_color)
					sampAddChatMessage(tag .. color_text .. "Чтобы {FFFFFF}установить{FFFF00} обновление, необходимо ввести {FFFFFF}/flinkupd", main_color)
					mbobnova = true
					checkupd = false
				else
					checkupd = false
					sampAddChatMessage(tag .. color_text .. "Обновлений {FFFFFF}не найдено{FFFF00}. Проверить наличие обновлений повторно можно введя {FFFFFF}/flinkupdcheck", main_color)
				end
				os.remove(update_path)
				checkupd = false
			end
		end)
	else
		sampAddChatMessage(tag .. color_text .. "Повторите проверку на наличие обновлений чуть {FFFFFF}позже{FFFF00}! Сейчас уже проходит данная проверка.", main_color)
	end
end

function mn()
	main_window.v = not main_window.v
	imgui.Process = main_window.v
end

function history()
	sampShowDialog(1337, "{FFFF00}История обновлений скрипта {FFFFFF}FastLink", "{FFFF00}Версия {FFFFFF}1.0{FFFF00}:\n{FFFFFF}- Релиз\n{FFFF00}Версия {FFFFFF}1.1{FFFF00}:\n{FFFFFF}- Теперь если в ссылке нет https:// или http://, скрипт найдет эту ссылку, если у нее будет один из доменов из массива\n{FFFF00}Версия {FFFFFF}1.2{FFFF00}:\n{FFFFFF}- Была добавлена команда, показывающая всю информацию о скрипте, \"/flinkinfo\"\n- Была добавлена возможность отключать скрипт (по умолчанию включен), \"/flinkwork\"\n{FFFF00}Версия {FFFFFF}1.21{FFFF00}:\n{FFFFFF}- Добавлен домен: .sk (для яндекс диска)\n{FFFF00}Версия {FFFFFF}1.3{FFFF00}:\n{FFFFFF}- Добавлено очень много новых доменов\n{FFFF00}Версия {FFFFFF}1.31{FFFF00}:\n{FFFFFF}- Более точное обнаружение ссылок в чате (доведено до идеала)\n{FFFF00}Версия {FFFFFF}1.4{FFFF00}:\n{FFFFFF}- Добавлено авто-обновление скрипта по команде, \"/flinkupd\"\n- Добавлена команда, проверяющая наличие обновлений скрипта, \"/flinkupdcheck\"\n- Добавлена команда, которая переносит в группу скрипта во ВКонтакте (самые первые новости об обновлениях), \"/flinkupdinfo\"\n- Добавлена команда, показывающая историю обновлений скрипта, \"/flinkupdhistory\"\n{FFFF00}Версия {FFFFFF}1.5{FFFF00}:\n{FFFFFF}- Теперь скрипт сам устанавливает все необходимые библиотеки (на данный момент криво, но работает)\n- Теперь при краше скрипта, будет вылезать соответствующее диалоговое окно\n{FFFF00}Версия {FFFFFF}1.6{FFFF00}:\n{FFFFFF}- {FFFFFF}Исправлена {FFFF00}проблема, когда скрипт крашил при запуске {FFFFFF}ГТА{FFFF00}\n{FFFFFF}- Команды были {FFFFFF}урезаны{FFFF00}:\n     {FFFFFF}/fastlink - /flink\n     /fastlinkwork - /flinkwork\n     /fastlinkupdate - /flinkupd\n     /fastlinkupdatecheck - /flinkupdcheck\n     /fastlinkupdateinfo - /flinkupdinfo\n     /fastlinkupdatehistory - /flinkupdhistory\n{FFFF00}Версия {FFFFFF}2.0{FFFF00}:\n{FFFFFF}- В скрипт было добавлено новое ImGui (Immediate Mode Graphic user interface) окно, в котором можно выключить скрипт, а также перейти либо скопировать три последние найденные ссылки, \"/flinkmn\"", "{ff0000}Закрыть", nil, DIALOG_STYLE_MSGBOX)
end

function onScriptTerminate(script, quitGame)
    if script == thisScript() then
    	main_window.v = not main_window.v
		imgui.Process = main_window.v
        sampShowDialog(1338, "{FFFF00}Краш скрипта {FFFFFF}FastLink", "{FFFF00}Скрипт был {FFFFFF}крашнут {FFFF00}по какой-то причине...\nВозможно, скрипт был {FFFFFF}перезагружен{FFFF00}, это могло посодействовать появлению данного окна\n\nЕсли же скрипт не был перезагружен, пожалуйста, обратитесь сюда: {FFFFFF}https://vk.com/klamet1/\nНе забудьте указать{FFFF00}, каким было ваше последнее действие перед {FFFFFF}крашем{FFFF00} скрипта.\n\n\n{ffff00}И последнее... Никогда не отчаивайтесь и запомните, {FFFFFF}Аллах {FFFF00}вам в помощь.\n{ff0033}ДОЛБИТЕ ВСЕМИ СИЛАМИ ПО КЛАВИШАМ, ПОСТОЯННО ПЕРЕЗАГРУЖАЙТЕ СКРИПТ КОМБИНАЦИЕЙ CTRL + R\nПОСТОЯННО ПЕРЕЗАПУСКАЙТЕ ГТА ЕСЛИ КОМБИНАЦИЯ НЕ СРАБОТАЛА И НАДЕЙТЕСЬ НА УДАЧУ ДО ПОСЛЕДНЕГО, ПОКА СКРИПТ НЕ ЗАРАБОТАЕТ\n{FFFF00}Ну или просто дождитесь {FFFFFF}фикса {FFFF00}от автора :)\nВсем {00FF00}б{FFFF00}обра и позитива, {FFFFFF}чао", "{ff0000}Автор гей", nil, DIALOG_STYLE_MSGBOX)
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
			ssilka = msg:match("https://(%S+)")
			ssilka = "https://" .. ssilka
			ssilka = ssilka:gsub('{......}', '')
			time1 = os.date("%X")
			abobus = true
			naideno = true
			sampAddChatMessage(tag .. color_text .. "В чате была {FFFFFF}найдена {FFFF00}новая ссылка. Для перехода: клавиша{FFFFFF} F2{FFFF00}, либо команда {FFFFFF}/flink", main_color)
			sampAddChatMessage(tag .. color_text .. "Ссылка: {FFFFFF}" .. ssilka, main_color)
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
			ssilka = msg:match("http://(%S+)")
			ssilka = "http://" .. ssilka
			ssilka = ssilka:gsub('{......}', '')
			time1 = os.date("%X")
			abobus = true
			naideno = true
			sampAddChatMessage(tag..color_text.."В чате была {FFFFFF}найдена {FFFF00}новая ссылка. Для перехода: клавиша{FFFFFF} F2{FFFF00}, либо команда {FFFFFF}/flink", main_color)
			sampAddChatMessage(tag .. color_text .. "Ссылка: {FFFFFF}" .. ssilka, main_color)
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
					if msg:match("www.%S+%." .. v .. "/%S+") then
						ssilka = ssilka .. "." .. v .. "/" .. two_ssilka
						ssilka = ssilka:gsub('{......}', '')
					else
						ssilka = "www." .. ssilka .. "." .. v .. "/" .. two_ssilka
						ssilka = ssilka:gsub('{......}', '')
					end
					abobus = true
					sampAddChatMessage(tag .. color_text .. "В чате была {FFFFFF}найдена {FFFF00}новая ссылка. Для перехода: клавиша{FFFFFF} F2{FFFF00}, либо команда {FFFFFF}/flink", main_color)
					sampAddChatMessage(tag .. color_text .. "Ссылка: {FFFFFF}" .. ssilka, main_color)
				elseif msg:match("(%S+)%." .. v .. "/") and not naideno then
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
						ssilka =  ssilka .. "." .. v .. "/"
						ssilka = ssilka:gsub('{......}', '')
					else
						ssilka = "www." .. ssilka .. "." .. v .. "/"
						ssilka = ssilka:gsub('{......}', '')
					end
					abobus = true
					sampAddChatMessage(tag .. color_text .. "В чате была {FFFFFF}найдена {FFFF00}новая ссылка. Для перехода: клавиша{FFFFFF} F2{FFFF00}, либо команда {FFFFFF}/flink", main_color)
					sampAddChatMessage(tag .. color_text .. "Ссылка: {FFFFFF}" .. ssilka, main_color)
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
							else
								ssilka = "www." .. ssilka .. "." .. v
								ssilka = ssilka:gsub('{......}', '')
							end
							abobus = true
							sampAddChatMessage(tag .. color_text .. "В чате была {FFFFFF}найдена {FFFF00}новая ссылка. Для перехода: клавиша{FFFFFF} F2{FFFF00}, либо команда {FFFFFF}/flink", main_color)
							sampAddChatMessage(tag .. color_text .. "Ссылка: {FFFFFF}" .. ssilka, main_color)
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
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)

	colors[clr.Text]                   = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.30, 0.30, 0.30, 1.00)
	colors[clr.WindowBg]               = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.ChildWindowBg]          = ImVec4(0.22, 0.22, 0.22, 0.00)
	colors[clr.PopupBg]                = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.Border]                 = ImVec4(0.00, 0.00, 0.00, 0.40)
	colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.FrameBg]                = ImVec4(0.00, 0.00, 0.00, 0.30)
	colors[clr.FrameBgHovered]         = ImVec4(0.62, 0.62, 0.62, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.46)
	colors[clr.TitleBg]                = ImVec4(1.00, 1.00, 1.00, 0.83)
	colors[clr.TitleBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.87)
	colors[clr.TitleBgCollapsed]       = ImVec4(1.00, 1.00, 1.00, 0.20)
	colors[clr.MenuBarBg]              = ImVec4(1.00, 1.00, 1.00, 0.80)
	colors[clr.ScrollbarBg]            = ImVec4(0.34, 0.72, 1.00, 0.60)
	colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.00, 1.00, 0.30)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.05, 0.00, 1.00, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 0.26, 1.00, 0.40)
	colors[clr.ComboBg]                = ImVec4(1.00, 1.00, 1.00, 0.99)
	colors[clr.CheckMark]              = ImVec4(0.00, 0.48, 1.00, 0.97)
	colors[clr.SliderGrab]             = ImVec4(0.00, 0.29, 1.00, 0.76)
	colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.45, 1.00, 0.99)
	colors[clr.Button]                 = ImVec4(0.00, 0.51, 1.00, 0.60)
	colors[clr.ButtonHovered]          = ImVec4(0.00, 0.40, 0.62, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.00, 0.59, 0.92, 1.00)
	colors[clr.Header]                 = ImVec4(0.06, 0.55, 0.87, 0.70)
	colors[clr.HeaderHovered]          = ImVec4(0.03, 0.21, 0.95, 0.46)
	colors[clr.HeaderActive]           = ImVec4(0.05, 0.05, 0.69, 0.80)
	colors[clr.Separator]              = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.SeparatorHovered]       = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.SeparatorActive]        = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(1.00, 1.00, 1.00, 0.30)
	colors[clr.ResizeGripHovered]      = ImVec4(1.00, 1.00, 1.00, 0.60)
	colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 0.90)
	colors[clr.CloseButton]            = ImVec4(1.00, 1.00, 1.00, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(1.00, 1.00, 1.00, 0.60)
	colors[clr.CloseButtonActive]      = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.00, 0.00, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35)
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

function imgui.BeforeDrawFrame()
    if fontsize25 == nil then
        fontsize25 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 25.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
    end
    if fontsize18 == nil then
    	fontsize18 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 18.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
    end
end

function imgui.OnDrawFrame()
	if not main_window.v then
		imgui.Process = false
		imgui.ShowCursor = false
	end
	if main_window.v then
		apply_custom_style()
		imgui.ShowCursor = true
		imgui.SetNextWindowSize(imgui.ImVec2(1200, 160), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2 - 600, sh / 2 - 80))
		imgui.Begin(u8"FastLink", nil, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove)
		imgui.BeginChild("ssilki", imgui.ImVec2(1188, 95), true, imgui.WindowFlags.NoScrollbar)
		if ssilka ~= nil then
			imgui.PushFont(fontsize18)
				ssilka = ssilka:gsub('{......}', '')
				imgui.TextColoredRGB("{003399}Ссылка {000000}\"{355e3b}" .. ssilka .. "{000000}\"{003399}, была получена в {9400d3}" .. time1 .. " {003399}|")
				imgui.SameLine()
				if imgui.CustomButton(u8"   перейти   ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00)) then
					os.execute("start " .. ssilka)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Переходим {FFFF00}по ссылке...", main_color)
				end
				imgui.SameLine()
				if imgui.CustomButton(u8"   скопировать   ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00)) then
					setClipboardText(ssilka)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Скопировано {FFFF00}в буффер обмена", main_color)
				end
			imgui.PopFont()
		end
		if ssilka2 ~= nil then
			imgui.PushFont(fontsize18)
				ssilka2 = ssilka2:gsub('{......}', '')
				imgui.TextColoredRGB("{003399}Ссылка {000000}\"{355e3b}" .. ssilka2 .. "{000000}\"{003399}, была получена в {9400d3}" .. time2 .. " {003399}|")
				imgui.SameLine()
				if imgui.CustomButton(u8"   перейти    ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00)) then
					os.execute("start " .. ssilka2)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Переходим {FFFF00}по ссылке...", main_color)
				end
				imgui.SameLine()
				if imgui.CustomButton(u8"   скопировать    ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00)) then
					setClipboardText(ssilka2)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Скопировано {FFFF00}в буффер обмена", main_color)
				end
			imgui.PopFont()
		end
		if ssilka3 ~= nil then
			imgui.PushFont(fontsize18)
				ssilka3 = ssilka3:gsub('{......}', '')
				imgui.TextColoredRGB("{003399}Ссылка {000000}\"{355e3b}" .. ssilka3 .. "{000000}\"{003399}, была получена в {9400d3}" .. time3 .. " {003399}|")
				imgui.SameLine()
				if imgui.CustomButton(u8"   перейти     ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00))  then
					os.execute("start " .. ssilka3)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Переходим {FFFF00}по ссылке...", main_color)
				end
				imgui.SameLine()
				if imgui.CustomButton(u8"   скопировать     ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00)) then
					setClipboardText(ssilka3)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Скопировано {FFFF00}в буффер обмена", main_color)
				end
			imgui.PopFont()
		end
		if ssilka == nil and ssilka2 == nil and ssilka3 == nil then
			imgui.PushFont(fontsize25)
				imgui.TextColoredRGB("{FF0000}В чате не было найдено ни одной ссылки!")
			imgui.PopFont()
		end
		imgui.EndChild()
		imgui.Separator()
		if work then
			imgui.PushFont(fontsize18)
				if imgui.CustomButton(u8"   отключить поиск ссылок в чате   ", imgui.ImVec4(1.00, 0.00, 0.00, 0.79), imgui.ImVec4(0.67, 0.40, 0.40, 1.00), imgui.ImVec4(1.00, 0.00, 0.00, 1.00)) then
					work = false
				end
			imgui.PopFont()
		else
			imgui.PushFont(fontsize18)
				if imgui.CustomButton(u8"   включить поиск ссылок в чате   ", imgui.ImVec4(0.00, 1.00, 0.20, 0.60), imgui.ImVec4(0.01, 0.51, 0.04, 1.00), imgui.ImVec4(0.12, 1.00, 0.00, 1.00)) then
					work = true
				end
			imgui.PopFont()
		end
		imgui.SameLine()
		imgui.PushFont(fontsize18)
			if imgui.CustomButton(u8"   проверить наличие обновлений   ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00))  then
				updcheck()
			end
		imgui.PopFont()
		imgui.SameLine()
		imgui.PushFont(fontsize18)
			if imgui.CustomButton(u8"   обновить   ", imgui.ImVec4(0.00, 0.17, 1.00, 1.00), imgui.ImVec4(0.00, 0.36, 1.00, 1.00), imgui.ImVec4(0.00, 0.17, 1.00, 1.00))  then
				upd()
			end
		imgui.PopFont()
		imgui.End()
	end
end