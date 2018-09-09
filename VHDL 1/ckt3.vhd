entity ckt3 is 
    port( A: IN BIT_VECTOR(3 downto 0);
          S: OUT BIT_VECTOR(1 downto 0));   
              
end ckt3;

Architecture funcionamento of ckt3 is
begin
 
    S(1) <= (A(3) or A(2)) xnor (A(3) xor (A(2) and A(1))); 
    s(0) <= (A(0) or (A(2) and A(1))) or (A(3) xor (A(2) and A(1)));
    
      
  end funcionamento;
