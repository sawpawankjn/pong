Ball = {};

function Ball:load()
   self.x = 100;
   self.y = 100;
   self.size = 32;
   self.x_speed = 200;
   self.y_speed = 200;
end

function Ball:update(dt)
    self:go(dt);
    self:bounce();
end

function Ball:go(dt)
    self.x = self.x + self.x_speed*dt;
    self.y = self.y + self.y_speed*dt;
end

function Ball:bounce()
    local player_collison = Collison(self.x,self.y,self.size,self.size,Player.x,Player.y,Player.width,Player.height);
    local cpu_collison = Collison(self.x,self.y,self.size,self.size,Cpu.x,Cpu.y,Cpu.width,Cpu.height);
     
    if player_collison or cpu_collison then
        self.x_speed = self.x_speed * -1;
    end

    if self.x >= love.graphics.getWidth() - self.size then
       self.x_speed = self.x_speed * -1;
       Player.score = Player.score + 1;
    end

    if self.x <= 0 then
        self.x_speed = self.x_speed * -1;
        Cpu.score = Cpu.score + 1;
     end

    if self.y >= love.graphics.getHeight() - self.size or self.y <= 0 then
       self.y_speed = self.y_speed * -1;
    end
end

function Ball:draw()
    love.graphics.setColor({0,1,0,1})
    love.graphics.rectangle("fill",self.x,self.y,self.size,self.size);
end

function Collison(x,y,w,h,x1,y1,w1,h1)
    return x + w > x1 and y + h > y1 and x1 + w1 > x and y1 + h1 > y
end