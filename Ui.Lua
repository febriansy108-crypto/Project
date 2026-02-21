local success, Chloex = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/albibot69-lgtm/ui/refs/heads/main/LexsUiC.lua"))()
end)

-- [[ load Window ]]
local Window = Chloex:Window({
    Title   = "Trio Reel Fish | Developer | ",                --- title
    Footer  = "V0.0.0.1",                   --- in right after title
    Image   = "103875081318049",           ---- rbxassetid (texture)
    Color   = Color3.fromRGB(0, 255, 255), --- colour text/ui
    Theme   = 9542022979,                  ---- background for theme ui (rbxassetid)
    Version = 1,                           --- version config set as default 1 if u remake / rewrite / big update and change name name in your hub change it to 2 and config will reset
})