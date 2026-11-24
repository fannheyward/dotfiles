rex.bind("cmd+right", "client.tab.next")
rex.bind("cmd+left", "client.tab.previous")

-- >>> leaf >>>
-- Managed by `leaf rex install`; `leaf rex uninstall` removes it.
-- plugin: 574a512c29e0d37d
dofile("/Users/fannheyward/.config/rex/plugins/leaf/init.lua").setup({ bin = { "/opt/homebrew/bin/leaf" } })
-- open: idle classic
-- <<< leaf <<<
