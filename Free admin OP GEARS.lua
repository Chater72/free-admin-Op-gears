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
Tab.ClipsDescendants = true
Tab.Visible = false -- Скрываем меню по умолчанию

-- Функция для перетаскивания
local function makeDraggable(frame)
    local dragToggle = nil
    local dragSpeed = 0.1
    local dragInput = nil
    local startPos = frame.Position

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            dragInput = input
            local mousePos = UDim2.new(input.Position.X, 0, input.Position.Y, 0)

            while dragToggle do
                game:GetService("RunService").RenderStepped:Wait()
                local delta = mousePos - UDim2.new(0, input.Position.X, 0, input.Position.Y)
                frame.Position = startPos + UDim2.new(delta.X.Scale, delta.X.Offset, delta.Y.Scale, delta.Y.Offset)
            end
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = false
        end
    end)
end

makeDraggable(Tab) -- Делаем вкладки перетаскиваемыми

-- Кнопка для открытия/закрытия меню
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = Menu
ToggleButton.Size = UDim2.new(0, 100, 0, 50) -- Изменено для компактности
ToggleButton.Position = UDim2.new(1, -110, 0, 20) -- Перемещено в правый угол
ToggleButton.Text = "Открыть меню"
ToggleButton.TextSize = 20

-- Убираем перетаскивание у кнопки
-- makeDraggable(ToggleButton) -- Удалено, чтобы не перетаскивалось

ToggleButton.MouseButton1Click:Connect(function()
    Tab.Visible = not Tab.Visible
    ToggleButton.Text = Tab.Visible and "Закрыть меню" or "Открыть меню"
end)

-- Перехват клавиши Insert для открытия меню
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        Tab.Visible = not Tab.Visible
        ToggleButton.Text = Tab.Visible and "Закрыть меню" or "Открыть меню"
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
