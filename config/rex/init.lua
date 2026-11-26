rex.bind("cmd+right", "client.tab.next")
rex.bind("cmd+left", "client.tab.previous")

-- >>> leaf >>>
-- Managed by `leaf rex install`; `leaf rex uninstall` removes it.
-- plugin: 4ba1d6441a3165f9
dofile("/Users/fannheyward/.config/rex/plugins/leaf/init.lua").setup({ bin = { "/opt/homebrew/bin/leaf" } })
-- open: idle dither
-- <<< leaf <<<
