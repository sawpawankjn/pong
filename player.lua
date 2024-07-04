Player = {};

function Player:load()
    self.width = 32;
    self.height = 128;
    self.x = 0;
    self.y = love.graphics.getWidth()/2 - self.height;
    self.speed = 180;
    self.color = {0,0,1,1};
    self.score = 0;
end

function Player:update(dt)
   self:go(dt);
end

function Player:go(dt)
    if love.keyboard.isDown("up") and self.y >= 0 then
        self.y = self.y - self.speed*dt;
    end
    if love.keyboard.isDown("down") and self.y <= love.graphics.getHeight()-self.height then
        self.y = self.y + self.speed*dt;
    end
end

function Player:draw()
    love.graphics.setColor(self.color);
    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height);
    local score = tostring(self.score);
    love.graphics.print(score,love.graphics.getWidth()/6,32,0,8,8);
end