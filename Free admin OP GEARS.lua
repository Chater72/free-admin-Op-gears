-- Создание меню
local Menu = Instance.new("ScreenGui")
Menu.Name = "ExploitMenu"
Menu.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создание вкладок
local Tab = Instance.new("Frame")
Tab.Name = "Tab"
Tab.Parent = Menu
Tab.BackgroundColor3 = Color3.new(1, 1, 1) -- Цвет фона вкладок (по желанию)
Tab.Position = UDim2.new(0.5, -200, 0.5, -250) -- Позиция центрированного меню
Tab.Size = UDim2.new(0, 400, 0, 500) -- Увеличение размера вкладок
Tab.Active = true
Tab.ClipsDescendants = true -- Обрезать потомков в пределах родительского элемента

-- Перехват клавиши Insert для открытия меню
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        Tab.Visible = not Tab.Visible
    end
end)

-- Функция для добавления кнопок
local function AddButton(Name, GearId)
    local Button = Instance.new("TextButton")
    Button.Parent = Tab
    Button.Size = UDim2.new(0.4, 0, 0, 30) -- Устанавливаем ширину кнопки для двух столбцов
    Button.Position = UDim2.new(0.05 + (0.45 * ((#Tab:GetChildren() - 1) % 2)), 0, 0, math.floor((#Tab:GetChildren() - 1) / 2) * 35) -- Изменено для двух колонок
    Button.Text = Name
    Button.TextSize = 20 -- Увеличение размера текста
    Button.MouseButton1Click:Connect(function()
        game.Players:Chat(":gear me " .. GearId)
    end)
end

-- Добавление кнопок с gear в меню
AddButton("Hammer", 45177979)
AddButton("Table", 243788010)
AddButton("Vacuum", 84418938)
AddButton("Bomb", 28277486)
AddButton("Taser", 82357123)
AddButton("Za warudo", 71037101)
AddButton("Coin Thief", 117544573)
AddButton("Judges Hammer", 1046322934)

-- Добавление новых gear в меню
AddButton("Zombie Staff", 26421972)
AddButton("Fire Staff", 32858741)
AddButton("Snowball", 19328185)
AddButton("Horn", 127506257)
AddButton("Remote Bomb", 33383241)
AddButton("Gravity Hammer", 33866846)
AddButton("Black Ray", 78005009)
AddButton("Rainbow Sword", 159229806)
AddButton("Potato", 25741198)
