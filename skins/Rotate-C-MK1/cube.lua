-- Rotating wireframe cube
-- Rotates a unit cube around the X and Y axes and projects it to 2D
-- using a simple perspective projection, every Update tick.

angleX = 0
angleY = 0

-- 8 corners of a cube centered on the origin
vertices = {
    {-1, -1, -1},
    { 1, -1, -1},
    { 1,  1, -1},
    {-1,  1, -1},
    {-1, -1,  1},
    { 1, -1,  1},
    { 1,  1,  1},
    {-1,  1,  1},
}

-- projected[i] will hold the {x, y} screen position of vertices[i]
projected = {}

-- Adjust these to resize/reposition/speed up or slow down the cube
size       = 45   -- half-size of the cube in pixels
centerX    = 70    -- canvas center X
centerY    = 70    -- canvas center Y
distance   = 4     -- perspective distance (bigger = flatter/less perspective)
speedX     = 0.04  -- radians per frame around X axis
speedY     = 0.025 -- radians per frame around Y axis

function Update()
    angleX = angleX + speedX
    angleY = angleY + speedY

    for i, v in ipairs(vertices) do
        local x, y, z = v[1], v[2], v[3]

        -- rotate around X axis
        local cosX, sinX = math.cos(angleX), math.sin(angleX)
        local y1 = y * cosX - z * sinX
        local z1 = y * sinX + z * cosX

        -- rotate around Y axis
        local cosY, sinY = math.cos(angleY), math.sin(angleY)
        local x2 = x * cosY + z1 * sinY
        local z2 = -x * sinY + z1 * cosY

        -- perspective projection (further away = smaller/closer to center)
        local scale = distance / (distance + z2)
        local px = x2 * scale * size + centerX
        local py = y1 * scale * size + centerY

        projected[i] = { px, py, z2 }
    end

    return 1
end

-- Section-variable accessors used from the .ini: [&MeasureCube:GetX(1)] etc.
function GetX(i)
    return projected[i][1]
end

function GetY(i)
    return projected[i][2]
end

-- Depth of a vertex, handy if you want to fade/color edges by distance later
function GetZ(i)
    return projected[i][3]
end
