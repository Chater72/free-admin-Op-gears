-- Создание меню
local Menu = Instance.new("ScreenGui")
Menu.Name = "ExploitMenu"
Menu.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создание вкладок
local Tab = Instance.new("Frame")
Tab.Name = "Tab"
Tab.Parent = Menu
Tab.BackgroundColor3 = Color3.new(0, 1, 0) -- Цвет фона вкладок (зеленый)
Tab.Position = UDim2.new(0.5, -200, 0.5, -250) -- Позиция центрированного меню
Tab.Size = UDim2.new(0, 600, 0, 600) -- Увеличение размера вкладок
Tab.Active = true
Tab.ClipsDescendants = true
Tab.Visible = false -- Скрываем меню по умолчанию

-- Функция для перетаскивания
local function makeDraggable(frame)
    local dragToggle = nil
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
ToggleButton.Size = UDim2.new(0, 120, 0, 60) -- Увеличен размер кнопки
ToggleButton.Position = UDim2.new(1, -130, 0, 70) -- Перемещено в правый угол
ToggleButton.Text = "Меню"
ToggleButton.TextSize = 24 -- Увеличение размера текста
ToggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Цвет кнопки открытия (зеленый)

-- Убираем перетаскивание у кнопки
-- makeDraggable(ToggleButton) -- Удалено, чтобы не перетаскивалось
ToggleButton.MouseButton1Click:Connect(function()
    Tab.Visible = not Tab.Visible
    ToggleButton.Text = Tab.Visible and "Закрыть" or "Открыть"
end)

-- Перехват клавиши Insert для открытия меню
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        Tab.Visible = not Tab.Visible
        ToggleButton.Text = Tab.Visible and "Закрыть" or "Открыть"
    end
end)

-- Функция для добавления кнопок
local function AddButton(Name, GearId)
    local Button = Instance.new("TextButton")
    Button.Parent = Tab
    Button.Size = UDim2.new(0.28, 0, 0, 40) -- Увеличиваем ширину кнопки
    Button.Position = UDim2.new(0.05 + (0.32 * ((#Tab:GetChildren() - 1) % 3)), 0, 0, math.floor((#Tab:GetChildren() - 1) / 3) * 45) -- Изменено для трех колонок
    Button.Text = Name
    Button.TextSize = 22 -- Увеличение размера текста
    Button.BorderSizePixel = 2 -- Устанавливаем рамку вокруг кнопки
    Button.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random()) -- Цвет фона кнопок (случайный)
    Button.BorderColor3 = Color3.new(0, 0, 0) -- Цвет рамки кнопок (по желанию)

    Button.MouseButton1Click:Connect(function()
        game.Players:Chat(":gear me " .. GearId)
    end)
end

-- Добавление кнопок с gear в меню
AddButton("Молот бога", 45177979)
AddButton("Стол", 243788010)
AddButton("Пылесос", 84418938)
AddButton("Бомба", 28277486)
AddButton("Тазер", 82357123)
AddButton("Остановка времени", 71037101)
AddButton("Золото", 117544573)
AddButton("Молот судьи", 1046322934)

-- Добавление новых gear в меню
AddButton("Посох Зомби", 26421972)
AddButton("Посох Огня", 32858741)
AddButton("Снежок", 19328185)
AddButton("Рог", 127506257)
AddButton("Мина", 33383241)
AddButton("летающий молот", 33866846)
AddButton("Черный Луч", 78005009)
AddButton("Меч бога", 159229806)
AddButton("Картошка", 25741198)

-- Добавление новых кнопок
AddButton("Запуск Елки", 330296114)
AddButton("Запуск Перчи", 168142620)
AddButton("Помощник", 84417104)
AddButton("Справа Нуб", 22960435)
AddButton("Пистолет бога", 17237675)
-- Добавление кнопки "Троллинг"
local TrollButton = Instance.new("TextButton")
TrollButton.Parent = Tab
TrollButton.Size = UDim2.new(0.28, 0, 0, 40) -- Увеличиваем высоту кнопки
TrollButton.Position = UDim2.new(0.05 + (0.32 * ((#Tab:GetChildren() - 1) % 3)), 0, 0, math.floor((#Tab:GetChildren() - 1) / 3) * 45) -- Изменено для трех колонок
TrollButton.Text = "Троллинг"
TrollButton.TextSize = 22 -- Увеличение размера текста
TrollButton.BorderSizePixel = 2 -- Устанавливаем рамку вокруг кнопки
TrollButton.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random()) -- Цвет фона кнопок (случайный)
TrollButton.BorderColor3 = Color3.new(0, 0, 0) -- Цвет рамки кнопок (по желанию)

TrollButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Chater72/Trolling-Free-admin/refs/heads/main/troll%20your%20friends.lua"))()
end)
