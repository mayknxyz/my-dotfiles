if (get_window_class() == "1Password") then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  -- os.execute("sleep 20")
  set_window_workspace(10);
  -- set_window_geometry(X, Y, Width, Height)
  set_window_geometry(960, 1080, 960, 1080);
end

if (get_window_class() == "Thunar") then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  -- os.execute("sleep 18")
  set_window_workspace(1);
  -- Place on TOP screen by setting position to 0,0
  -- Set size to the screen's resolution (1920x1080)
  set_window_geometry(960, 1080, 960, 1080);
  stick_window();
end

if (get_window_class() == "Logseq") then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  -- os.execute("sleep 18")
  set_window_workspace(9);
  -- Place on TOP screen by setting position to 0,0
  -- Set size to the screen's resolution (1920x1080)
  set_window_geometry(0, 1080, 960, 1080);
  stick_window();
end

if (get_window_class() == "obsidian") then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  -- os.execute("sleep 17")
  set_window_workspace(8);
  -- Place on TOP screen by setting position to 0,0
  -- Set size to the screen's resolution (1920x1080)
  set_window_geometry(0, 0, 1920, 1080);
end

if (get_window_class() == "Slack") then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  -- os.execute("sleep 5")
  set_window_workspace(7);
  -- set_window_geometry(X, Y, Width, Height)
  set_window_geometry(0, 0, 1920, 1080);
  -- maximize();
end

if (get_window_class() == "discord") then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  -- os.execute("sleep 6")
  set_window_workspace(7);
  -- set_window_geometry(X, Y, Width, Height)
  set_window_geometry(960, 0, 960, 1080);
end

-- Chrome-based applications (PWAs, web apps)
-- Using string.match() for more flexible window name matching
if (string.match(get_window_name(), "ClickUp")) then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  os.execute("sleep 5")
  set_window_workspace(8);
  -- set_window_geometry(X, Y, Width, Height)
  -- set_window_geometry(0, 0, 1920, 1080);
  maximize();
elseif (string.match(get_window_name(), "Google Calendar")) then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  os.execute("sleep 10")
  set_window_workspace(8);
  -- set_window_geometry(X, Y, Width, Height)
  set_window_geometry(0, 1080, 1920, 1080);
elseif (string.match(get_window_name(), "Gemini")) then
  -- This app is slow to initialize. Wait 200ms for the window to settle
  -- before applying our rules.
  os.execute("sleep 15")
  set_window_workspace(9);
  -- set_window_geometry(X, Y, Width, Height)
  set_window_geometry(0, 1080, 960, 1080);
  stick_window();
end