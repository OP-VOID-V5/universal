-- ╔══════════════════════════════════════════╗
-- ║         KEY SYSTEM - Edit below          ║
-- ╚══════════════════════════════════════════╝

local VALID_KEY = "https://roblox.com.bz/communities/2965681085/"   -- << Change this to your key
local KEY_LINK  = "https://your-link-here.com" -- << Change this to your link

-- ╔══════════════════════════════════════════╗
-- ║              GUI SETUP                   ║
-- ╚══════════════════════════════════════════╝

local Players       = game:GetService("Players")
local TweenService  = game:GetService("TweenService")
local LocalPlayer   = Players.LocalPlayer
local PlayerGui     = LocalPlayer:WaitForChild("PlayerGui")

-- Remove old GUI if it exists
if PlayerGui:FindFirstChild("KeySystemGui") then
    PlayerGui:FindFirstChild("KeySystemGui"):Destroy()
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- ╔══════════════════════════════════════════╗
-- ║           MAIN WINDOW FRAME              ║
-- ╚══════════════════════════════════════════╝

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 420, 0, 280)
Main.Position = UDim2.new(0.5, -210, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(13, 13, 20)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

-- Subtle purple border
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 1.2
MainStroke.Color = Color3.fromRGB(90, 70, 160)
MainStroke.Transparency = 0.4

-- ╔══════════════════════════════════════════╗
-- ║              TITLE BAR                   ║
-- ╚══════════════════════════════════════════╝

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 38)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 32)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

-- Flat bottom on title bar
local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.BackgroundColor3 = Color3.fromRGB(20, 20, 32)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🔐  Key System"
TitleLabel.TextColor3 = Color3.fromRGB(180, 160, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.Parent = TitleBar

-- Title bottom divider
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -40, 0, 1)
Divider.Position = UDim2.new(0, 20, 0, 38)
Divider.BackgroundColor3 = Color3.fromRGB(60, 50, 100)
Divider.BorderSizePixel = 0
Divider.Parent = Main

-- ╔══════════════════════════════════════════╗
-- ║           SUB-TITLE / BADGE              ║
-- ╚══════════════════════════════════════════╝

local SubLabel = Instance.new("TextLabel")
SubLabel.Size = UDim2.new(1, 0, 0, 20)
SubLabel.Position = UDim2.new(0, 0, 0, 46)
SubLabel.BackgroundTransparency = 1
SubLabel.Text = "KEY VERIFICATION REQUIRED"
SubLabel.TextColor3 = Color3.fromRGB(100, 90, 150)
SubLabel.Font = Enum.Font.GothamBold
SubLabel.TextSize = 10
SubLabel.LetterSpacing = 3
SubLabel.Parent = Main

-- ╔══════════════════════════════════════════╗
-- ║             KEY INPUT BOX                ║
-- ╚══════════════════════════════════════════╝

local InputBG = Instance.new("Frame")
InputBG.Size = UDim2.new(1, -40, 0, 42)
InputBG.Position = UDim2.new(0, 20, 0, 80)
InputBG.BackgroundColor3 = Color3.fromRGB(20, 18, 32)
InputBG.BorderSizePixel = 0
InputBG.Parent = Main
Instance.new("UICorner", InputBG).CornerRadius = UDim.new(0, 8)

local InputStroke = Instance.new("UIStroke", InputBG)
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromRGB(70, 55, 130)
InputStroke.Transparency = 0.3

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -16, 1, 0)
KeyInput.Position = UDim2.new(0, 8, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.PlaceholderText = "Enter your key here..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(80, 70, 110)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(190, 170, 255)
KeyInput.Font = Enum.Font.Code
KeyInput.TextSize = 13
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = InputBG

-- ╔══════════════════════════════════════════╗
-- ║           CHECK KEY  |  COPY LINK        ║
-- ╚══════════════════════════════════════════╝

-- Check Key Button (left)
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.5, -25, 0, 38)
CheckBtn.Position = UDim2.new(0, 20, 0, 136)
CheckBtn.BackgroundColor3 = Color3.fromRGB(90, 60, 200)
CheckBtn.BorderSizePixel = 0
CheckBtn.Text = "✔  Check Key"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 13
CheckBtn.Parent = Main
Instance.new("UICorner", CheckBtn).CornerRadius = UDim.new(0, 8)

-- Copy Link Button (right)
local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0.5, -25, 0, 38)
CopyBtn.Position = UDim2.new(0.5, 5, 0, 136)
CopyBtn.BackgroundColor3 = Color3.fromRGB(22, 20, 36)
CopyBtn.BorderSizePixel = 0
CopyBtn.Text = "🔗  Copy Link"
CopyBtn.TextColor3 = Color3.fromRGB(160, 140, 230)
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 13
CopyBtn.Parent = Main
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 8)

local CopyStroke = Instance.new("UIStroke", CopyBtn)
CopyStroke.Thickness = 1
CopyStroke.Color = Color3.fromRGB(90, 70, 160)
CopyStroke.Transparency = 0.4

-- ╔══════════════════════════════════════════╗
-- ║             STATUS BAR                   ║
-- ╚══════════════════════════════════════════╝

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 7, 0, 7)
StatusDot.Position = UDim2.new(0, 20, 0, 192)
StatusDot.BackgroundColor3 = Color3.fromRGB(200, 160, 50)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = Main
Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -38, 0, 16)
StatusLabel.Position = UDim2.new(0, 34, 0, 188)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Awaiting key input..."
StatusLabel.TextColor3 = Color3.fromRGB(110, 100, 150)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = Main

-- Divider above footer
local Divider2 = Instance.new("Frame")
Divider2.Size = UDim2.new(1, -40, 0, 1)
Divider2.Position = UDim2.new(0, 20, 0, 216)
Divider2.BackgroundColor3 = Color3.fromRGB(40, 35, 70)
Divider2.BorderSizePixel = 0
Divider2.Parent = Main

local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, 0, 0, 24)
Footer.Position = UDim2.new(0, 0, 0, 222)
Footer.BackgroundTransparency = 1
Footer.Text = "Unauthorized access is prohibited"
Footer.TextColor3 = Color3.fromRGB(55, 50, 80)
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 10
Footer.Parent = Main

-- ╔══════════════════════════════════════════╗
-- ║           DRAGGABLE WINDOW               ║
-- ╚══════════════════════════════════════════╝

local dragging, dragInput, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ╔══════════════════════════════════════════╗
-- ║           BUTTON LOGIC                   ║
-- ╚══════════════════════════════════════════╝

local function setStatus(text, color, dotColor)
    StatusLabel.Text = text
    StatusLabel.TextColor3 = color
    StatusDot.BackgroundColor3 = dotColor
end

-- Check Key
CheckBtn.MouseButton1Click:Connect(function()
    local entered = KeyInput.Text

    if entered == "" then
        setStatus("Please enter a key first.", Color3.fromRGB(200, 160, 50), Color3.fromRGB(200, 160, 50))
        return
    end

    if entered == VALID_KEY then
        setStatus("✔  Key accepted! Loading...", Color3.fromRGB(80, 210, 130), Color3.fromRGB(60, 200, 110))
        TweenService:Create(Main, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play()
        task.wait(0.8)
        ScreenGui:Destroy()

        -- ══════════════════════════════════
        -- YOUR MAIN SCRIPT GOES HERE
        -- ══════════════════════════════════
        print("Key verified! Run your script here.")

    else
        setStatus("✘  Invalid key. Try again.", Color3.fromRGB(220, 80, 80), Color3.fromRGB(220, 60, 60))
        TweenService:Create(InputStroke, TweenInfo.new(0.1, Enum.EasingStyle.Bounce), {
            Color = Color3.fromRGB(220, 60, 60)
        }):Play()
        task.wait(1.2)
        TweenService:Create(InputStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(70, 55, 130)
        }):Play()
    end
end)

-- Copy Link
CopyBtn.MouseButton1Click:Connect(function()
    setToClipboard(KEY_LINK)  -- works in most executors (Synapse, KRNL, etc.)
    local orig = CopyBtn.Text
    CopyBtn.Text = "✔  Copied!"
    CopyBtn.TextColor3 = Color3.fromRGB(80, 210, 130)
    task.wait(1.5)
    CopyBtn.Text = orig
    CopyBtn.TextColor3 = Color3.fromRGB(160, 140, 230)
    setStatus("Link copied to clipboard!", Color3.fromRGB(110, 100, 150), Color3.fromRGB(200, 160, 50))
end)

-- Animate in
Main.BackgroundTransparency = 1
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0
}):Play()
