require("ball");
require("cpu");
require("player");

function love.load()
    Ball:load();
    Player:load();
    Cpu:load();
end

function love.update(dt)
    Ball:update(dt);
    Player:update(dt);
    Cpu:update(dt);
end

function love.draw()
    Ball:draw();
    Player:draw();
    Cpu:draw();
end