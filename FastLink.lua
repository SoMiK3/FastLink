-- Author - https://vk.com/klamet1

require "lib.sampfuncs"
require "lib.moonloader"

script_name("FastLink")
script_author("�����")
script_version("1.4")
local sampev = require "lib.samp.events"
local keys = require "vkeys"
local dlstatus = require('moonloader').download_status
local inicfg = require "inicfg"

local main_color = 0x5A90CE
local color_text = "{FFFF00}"
local tag = "[Fastlink]: "

local script_vers = 2
local script_vers_text = "1.4"
local script_path = thisScript().path
local script_url = "https://raw.githubusercontent.com/SoMiK3/FastLink/main/FastLink.lua"
local update_path = getWorkingDirectory() .. "/update.ini"
local update_url = "https://raw.githubusercontent.com/SoMiK3/FastLink/main/update.ini"

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end

	sampRegisterChatCommand("fastlink", golink)
	sampRegisterChatCommand("fastlinkwork", work)
	sampRegisterChatCommand("fastlinkinfo", info)
	sampRegisterChatCommand("fastlinkupdate", upd)
	sampRegisterChatCommand("fastlinkupdateinfo", updinfo)
	sampRegisterChatCommand("fastlinkupdatecheck", updcheck)
	sampRegisterChatCommand("fastlinkupdatehistory", history)

	work = true
	abobus = false
	naideno = false
	mbobnova = false
	obnova = false
	checkupd = false

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

	sampAddChatMessage(tag .. color_text .. "������ ����� � ������. ����� - " .. "{FFFFFF}" ..  "�����" .. color_text .. "! ����������: " .. "{FFFFFF}" .. "/fastlinkinfo", main_color)
	sampAddChatMessage(tag .. color_text .. "�������� ������ ��� ����� ������ �� {FFFFFF}ARZ RP(G) {FFFF00}�� ����� �� ������: {FFFFFF}https://www.blast.hk/threads/98245/", main_color)
	sampAddChatMessage(tag .. color_text .. "��� �������� �� ������ {FFFFFF}https://www.blast.hk/threads/98245/{FFFF00} ������� {FFFFFF}F3", main_color)

	downloadUrlToFile(update_url, update_path, function(id, status)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			checkupd = true
			updateIni = inicfg.load(nil, update_path)
			if tonumber(updateIni.info.vers) > script_vers then
				sampAddChatMessage(tag .. color_text .. "���� {FFFFFF}����������{FFFF00}! ����� ������: {FFFFFF}" .. updateIni.info.vers_text .."{FFFF00}. ������� ������: {FFFFFF}".. script_vers_text .. "{FFFF00}.", main_color)
				sampAddChatMessage(tag .. color_text .. "������ ��������� ����� � ������ ������� �� {FFFFFF}���������{FFFF00}. ������� ��� ��������: {FFFFFF}/fastlinkupdateinfo", main_color)
				sampAddChatMessage(tag .. color_text .. "����� {FFFFFF}����������{FFFF00} ����������, ���������� ������ {FFFFFF}/fastlinkupdate", main_color)
				mbobnova = true
				checkupd = false
			else
				checkupd = false
				sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�� �������{FFFF00}. ��������� ������� ���������� �������� ����� ����� {FFFFFF}/fastlinkupdatecheck", main_color)
			end
			os.remove(update_path)
			checkupd = false
		end
	end)

	while true do
	wait(0)
		if isKeyJustPressed(0x71) and not isPauseMenuActive() and work == true then
			if abobus then
				sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ��������� ��������� ������...", main_color)
				os.execute("start " .. ssilka)
			else
				sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}�� �������{FFFF00}. ���������, ���� � ���� �������� ���� �� ���� ������.", main_color)
			end
		end
		if isKeyJustPressed(0x72) and not isPauseMenuActive() and work == true then
			sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ������...", main_color)
			os.execute("start https://www.blast.hk/threads/98245/")
		end
		if obnova then
			downloadUrlToFile(script_url, script_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�������{FFFF00} �����������. ����� ������: {FFFFFF}" .. updateIni.info.vers_text, main_color)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}������{FFFF00} ������� ���������� �����, ����� {FFFFFF}/fastlinkupdatehistory", main_color)
				end
			end)
			break
		end
	end
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
		sampAddChatMessage(tag .. color_text .. "������ ��� {FFFFFF}��������{FFFF00}. ��� ��������� ���� ������ ������� {FFFFFF}/fastlinkwork", main_color)
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
	sampAddChatMessage(tag .. color_text .. "������ {FFFFFF}FastLink {FFFF00}��� ������ ��� ������� ����� ������ �� ���� � ��� �������� �������� �� ���", main_color)
	sampAddChatMessage(tag .. color_text .. "��� ������ � ���� �������� ������ ������ � ������� {FFFFFF}https://������{FFFF00} ���� {FFFFFF}http://������{FFFF00}, ������", main_color)
	sampAddChatMessage(tag .. color_text .. "{FFFFFF}�������� {FFFF00}����������� ��������� � {FFFFFF}��������� {FFFF00}������� �� ��������� ������. ��� �� ������ �����", main_color)
	sampAddChatMessage(tag .. color_text .. "������������ � �� ������� �������� ������ �� ���� {FFFFFF}google.com/123/{FFFF00}, �� ������ ������� ���������, ������ ���:", main_color)
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
	sampAddChatMessage(tag .. color_text .. "����� ������ ���������/����� ����������� ������ � ���� (�� ��������� ���), ���������� ������ �������: {FFFFFF}/fastlinkwork", main_color)
	sampAddChatMessage(tag .. color_text .. "����� ��������� ������� {FFFFFF}����������{FFFF00} �������, ���������� ������ {FFFFFF}/fastlinkupdatecheck", main_color)
	sampAddChatMessage(tag .. color_text .. "����� ������� ������� {FFFFFF}����������{FFFF00} �������, ���������� ������ {FFFFFF}/fastlinkupdatehistory", main_color)
end

function updinfo()
	os.execute("start https://vk.com/fastlink_samp")
	sampAddChatMessage(tag .. color_text .. "{FFFFFF}��������� {FFFF00}�� ������...", main_color)
end

function upd()
	if mbobnova then
		sampAddChatMessage(tag .. color_text .. "������� {FFFFFF}������������� {FFFF00}��������� ����������", main_color)
		obnova = true
	else
		sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�� �������{FFFF00}. ��������� ������� ���������� �������� ����� ����� {FFFFFF}/fastlinkupdatecheck", main_color)
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
					sampAddChatMessage(tag .. color_text .. "���� {FFFFFF}����������{FFFF00}! ����� ������: {FFFFFF}" .. updateIni.info.vers_text .. "{FFFF00}. ������� ������: {FFF-FFF}".. script_vers_text .. "{FFFF00}.", main_color)
					sampAddChatMessage(tag .. color_text .. "������ ��������� ����� � ������ ������� �� {FFFFFF}���������{FFFF00}. ������� ��� ��������: {FFFFFF}/fastlinkupdateinfo", main_color)
					sampAddChatMessage(tag .. color_text .. "����� {FFFFFF}����������{FFFF00} ����������, ���������� ������ {FFFFFF}/fastlinkupdate", main_color)
					mbobnova = true
					checkupd = false
				else
					checkupd = false
					sampAddChatMessage(tag .. color_text .. "���������� {FFFFFF}�� �������{FFFF00}. ��������� ������� ���������� �������� ����� ����� {FFFFFF}/fastlinkupdatecheck", main_color)
				end
				os.remove(update_path)
				checkupd = false
			end
		end)
	else
		sampAddChatMessage(tag .. color_text .. "��������� �������� �� ������� ���������� ���� {FFFFFF}�����{FFFF00}! ������ ��� �������� ������ ��������.", main_color)
	end
end

function history()
	sampShowDialog(1337, "{FFFF00}������� ���������� ������� {FFFFFF}FastLink", "{FFFF00}������ {FFFFFF}1.0{FFFF00}:\n{FFFFFF}- �����\n{FFFF00}������ {FFFFFF}1.1{FFFF00}:\n{FFFFFF}- ������ ���� � ������ ��� https:// ��� http://, ������ ������ ��� ������, ���� � ��� ����� ���� �� ������� �� �������\n{FFFF00}������ {FFFFFF}1.2{FFFF00}:\n{FFFFFF}- ���� ��������� �������, ������������ ��� ���������� � �������, \"/fastlinkinfo\"\n- ���� ��������� ����������� ��������� ������ (�� ��������� �������), \"/fastlinkwork\"\n{FFFF00}������ {FFFFFF}1.21{FFFF00}:\n{FFFFFF}- �������� �����: .sk (��� ������ �����)\n{FFFF00}������ {FFFFFF}1.3{FFFF00}:\n{FFFFFF}- ��������� ����� ����� ����� �������\n{FFFF00}������ {FFFFFF}1.31{FFFF00}:\n{FFFFFF}- ����� ������ ����������� ������ � ���� (�������� �� ������)\n{FFFF00}������ {FFFFFF}1.4{FFFF00}:\n{FFFFFF}- ��������� ����-���������� ������� �� �������, \"/fastlinkupdate\"\n- ��������� �������, ����������� ������� ���������� �������, \"/fastlinkupdatecheck\"\n- ��������� �������, ������� ��������� � ������ ������� �� ��������� (����� ������ ������� �� ����������), \"/fastlinkupdateinfo\"\n- ��������� �������, ������������ ������� ���������� �������, \"/fastlinkupdatehistory\"", "{ff0000}�������", nil, DIALOG_STYLE_MSGBOX)
end

function sampev.onServerMessage(color, msg)
	if work then
		if msg:find("https://(%S+)") then
			ssilka = msg:match("https://(%S+)")
			ssilka = "https://" .. ssilka
			abobus = true
			naideno = true
			sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: �������{FFFFFF} F2{FFFF00}, ���� ������� {FFFFFF}/fastlink", main_color)
			sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
		end
		if msg:find("http://(%S+)") then
			ssilka = msg:match("http://(%S+)")
			ssilka = "http://" .. ssilka
			abobus = true
			naideno = true
			sampAddChatMessage(tag..color_text.."� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: �������{FFFFFF} F2{FFFF00}, ���� ������� {FFFFFF}/fastlink", main_color)
			sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
		end
		if not naideno then
			for _,v in ipairs(l) do
				if msg:match("(%S+)%." .. v .. "/(%S+)") then
					ssilka, two_ssilka = msg:match("(%S+)%." .. v .. "/(%S+)")
					if msg:match("www.%S+%." .. v .. "/%S+") then
						ssilka =  ssilka .. "." .. v .. "/" .. two_ssilka
					else
						ssilka = "www." .. ssilka .. "." .. v .. "/" .. two_ssilka
					end
					abobus = true
					sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: �������{FFFFFF} F2{FFFF00}, ���� ������� {FFFFFF}/fastlink", main_color)
					sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
				elseif msg:match("(%S+)%." .. v .. "/") and not naideno then
					ssilka = msg:match("(%S+)%." .. v .. "/")
					if msg:match("www.%S+%." .. v .. "/") then
						ssilka =  ssilka .. "." .. v .. "/"
					else
						ssilka = "www." .. ssilka .. "." .. v .. "/"
					end
					abobus = true
					sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: �������{FFFFFF} F2{FFFF00}, ���� ������� {FFFFFF}/fastlink", main_color)
					sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
				elseif msg:match("(%S+)%." .. v) and not naideno then
					if msg:match("(%S+)%." .. v) then
						if not msg:match("(%S+)%." .. v .. "%S+") then
							ssilka = msg:match("(%S+)%." .. v)
							if msg:match("www.%S+%." .. v) then
								ssilka =  ssilka .. "." .. v
							else
								ssilka = "www." .. ssilka .. "." .. v
							end
							abobus = true
							sampAddChatMessage(tag .. color_text .. "� ���� ���� {FFFFFF}������� {FFFF00}����� ������. ��� ��������: �������{FFFFFF} F2{FFFF00}, ���� ������� {FFFFFF}/fastlink", main_color)
							sampAddChatMessage(tag .. color_text .. "������: {FFFFFF}" .. ssilka, main_color)
						end
					end
				end
			end
		end
		naideno = false
	end
end