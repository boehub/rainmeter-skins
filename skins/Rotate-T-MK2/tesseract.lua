-- Rotating tesseract (4D hypercube)
-- 16 vertices, each a combination of (+1/-1) in x, y, z, w.
-- Rotates simultaneously in the XW and YZ planes (a "double rotation"),
-- which is what gives a tesseract its characteristic tumbling,
-- turning-inside-out look. Then projects 4D -> 3D -> 2D each frame.

angleXW = 0
angleYZ = 0

-- Tweak these to change speed
speedXW = 0.013
speedYZ = 0.019

-- Tweak these to resize/reposition/adjust perspective strength
size       = 34   -- overall scale in pixels
centerX    = 90    -- canvas center X
centerY    = 90    -- canvas center Y
distanceW  = 3     -- 4D -> 3D perspective distance (smaller = stronger effect)
distanceZ  = 4      -- 3D -> 2D perspective distance

-- Build all 16 vertices: every combination of -1/+1 across 4 axes
vertices = {}
for n = 0, 15 do
    local x = (n % 2 == 0) and -1 or 1
    local y = (math.floor(n / 2) % 2 == 0) and -1 or 1
    local z = (math.floor(n / 4) % 2 == 0) and -1 or 1
    local w = (math.floor(n / 8) % 2 == 0) and -1 or 1
    vertices[n + 1] = { x, y, z, w }
end

projected = {}

function Update()
    angleXW = angleXW + speedXW
    angleYZ = angleYZ + speedYZ

    local cosXW, sinXW = math.cos(angleXW), math.sin(angleXW)
    local cosYZ, sinYZ = math.cos(angleYZ), math.sin(angleYZ)

    for i, v in ipairs(vertices) do
        local x, y, z, w = v[1], v[2], v[3], v[4]

        -- rotate in the XW plane (rotation "through" the 4th dimension)
        local x1 = x * cosXW - w * sinXW
        local w1 = x * sinXW + w * cosXW

        -- rotate in the YZ plane (ordinary 3D-style rotation)
        local y1 = y * cosYZ - z * sinYZ
        local z1 = y * sinYZ + z * cosYZ

        -- project 4D -> 3D using w as the "extra" depth axis
        local scale4 = distanceW / (distanceW + w1)
        local x3 = x1 * scale4
        local y3 = y1 * scale4
        local z3 = z1 * scale4

        -- project 3D -> 2D using z as depth
        local scale3 = distanceZ / (distanceZ + z3)
        local px = x3 * scale3 * size + centerX
        local py = y3 * scale3 * size + centerY

        projected[i] = { px, py }
    end

    return 1
end

-- Section-variable accessors used from the .ini
function GetX(i)
    return projected[i][1]
end

function GetY(i)
    return projected[i][2]
end
