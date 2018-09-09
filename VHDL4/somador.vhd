entity somador is
  port (a: in bit;
        b: in bit;
        ci: in bit;
        co: out bit;
        s: out bit );
        
end somador;


architecture funcionamento of somador is
  begin
  
  co <= (b and ci) or (a and ci) or (a and b);
  s <= a xor b xor ci;
  
end funcionamento; 
  
  
