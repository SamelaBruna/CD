entity comparador is 
  port(A,B: in bit_vector(3 downto 0);
       eq,bt,lt: out bit
       );
       
end comparador;
       
  architecture funcionamento of comparador is 
  
  signal eqout,btout: bit;
  signal ab: bit_vector(3 downto 0); 
  
  begin
    
  ab(0) <= A(0) xnor B(0);
  ab(1) <= A(1) xnor B(1);
  ab(2) <= A(2) xnor B(2);
  ab(3) <= A(3) xnor B(3); 
   
  eqout <= (A(0) xnor B(0)) and (A(1) xnor B(1)) and (A(2) xnor B(2)) and (A(3) xnor B(3));
  btout <= (not B(3) and A(3)) or (ab(3) and not B(2) and A(2)) or (ab(3) and ab(2) and not B(1) and A(1)) or (ab(3) and ab(2) and ab(1) and not B(0) and A(0));
  lt <= eqout nor btout;
  
  eq <= eqout;
  bt <= btout;
  
end funcionamento; 