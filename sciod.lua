LogoPartai = {
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/demokrat.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/gerindra.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/golkar.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/nasdem.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/pdip.jpeg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/perindo.png"
}

Lopar = math.random(1, #LogoPartai)

function ohdtag(logger)
    local script = [[
        $w = "]]..PingHook..[["

        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

        $Body = [PSCustomObject]@{
            'username' = ']]..getBot().name..[[ | Ohdear'
            'content' = '<@]]..userdc..[[> ]]..logger..[['
        }

        Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
    ]]

    local pipe = io.popen("powershell -command -", "w")
    pipe:write(script)
    pipe:close()
end


function ohdsay(logger)

MenitRdp = (os.date("*t", os.time()).min)
JamRdp = (os.date("*t", os.time()).hour) + Selisih

if JamRdp >= 24 then
    JamRdp = JamRdp - 24
end

if JamRdp < 10 then
    myJam = "0"..JamRdp
else
    myJam = JamRdp
end
    
    TotTime = "\nTime : ("..myJam..":"..MenitRdp..")"
    
    Judulz = "Auto Science || "..#ListPembeli.." Users"

    if farmID == 928 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/kontolodon/main/pict/science.png"
    else
        Thumbs = ""
    end

    if getBot().status == "online" then
        statzBot = ":green_circle:"
        Warna = 7405312
    else
        statzBot = ":red_circle:"
        Warna = 16711680
    end

    WorldSkrg = (getBot().world):upper()
    if RingkasWorldName then
        Muncul = false
        for _, v in pairs(World) do
            if v:upper() == WorldSkrg then
                Muncul = true
            end
        end
        if WorldDrop:upper() == WorldSkrg then
            Muncul = true
        end
        if Muncul then
            WorldSkrg = WorldSkrg:gsub(string.sub(WorldSkrg, 1, string.len(WorldSkrg) - 3), "")
        end
    end

    AllIn = emot_bot.." Bot Name : "..getBot().name.." (Lv "..getBot().level..
    ")\n:earth_asia: Current World : "..WorldSkrg..
    "\n"..statzBot.." Status : "..(getBot().status):upper().." ("..getPing()..
    " Ms)\n:boom: Provider : "..GetNameID(farmID)..
    "\n:hourglass: Uptime : "..HitungWaktu(AlwaysTime)

    URLWeb = MainHook.."/messages/"..HookID

    local script = [[

    $w = "]]..URLWeb..[["

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    [System.Collections.ArrayList]$embedArray = @()
    $descriptions = ']].. logger ..[['
    $color       = ']]..Warna..[['

    $thumbnailObject = [PSCustomObject]@{
        url = ']].. Thumbs ..[['
    }

    $footerObject = [PSCustomObject]@{
        text = 'Auto Science Farm by Ohdear#2320 ]]..TotTime..[['
        icon_url = ']].. Thumbs ..[['
    }

    $authorObject = [PSCustomObject]@{
        name = "]]..Judulz..[[ || Author : Ohdear#2320"
        url = "https://discord.gg/TjVwdgma74"
        icon_url = "]]..LogoPartai[Lopar]..[["
    }

    $fieldArray = @(

        @{
            name = "Bot Information"
            value = "]]..AllIn..[["
            inline = "false"
        }

        @{
            name = ":earth_asia: World Harvest"
            value = "]]..ShowWorld..[["
            inline = "true"
        }
        @{
            name = ":earth_asia: World Storage"
            value = "]]..ShowStorage..[["
            inline = "true"
        }
    )

    $embedObject = [PSCustomObject]@{
        description = $descriptions
        color       = $color
        thumbnail   = $thumbnailObject
        footer      = $footerObject
        author      = $authorObject
        fields      = $fieldArray
    }

    $embedArray.Add($embedObject) | Out-Null

    $Body = [PSCustomObject]@{

        embeds = $embedArray

        'username' = ']]..getBot().name..[[ | Ohdear'

    }

    Invoke-RestMethod -Uri $w -Body ($Body | ConvertTo-Json -Depth 4) -Method Patch -ContentType 'application/json'
    ]]
    local pipe = io.popen("powershell -command -", "w")
    pipe:write(script)
    pipe:close()
end
