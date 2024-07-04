Cpu = {};

function Cpu:load()
    self.width = 32;
    self.height = 128;
    self.x = love.graphics.getWidth()-self.width;
    self.y = love.graphics.getHeight() - self.height;
    self.speed = 180;
    self.color = {1,0,0,1};
    self.score = 0;
end

function Cpu:update(dt)
    self:move(dt);
end

function Cpu:move(dt)
    if Ball.y > self.y and self.y <= love.graphics.getHeight()-self.height then
        self.y = self.y + self.speed*dt;
    elseif Ball.y < self.y and self.y >= 0 then
        self.y = self.y - self.speed*dt;
    end
end

function Cpu:draw()
    love.graphics.setColor(self.color);
    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height);
    local score = tostring(self.score);
    love.graphics.print(score,love.graphics.getWidth() - (love.graphics.getWidth()/6+32),32,0,8,8);
end