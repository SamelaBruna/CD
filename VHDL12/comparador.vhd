entity comparador is 
  port(A,B: in bit_vector(7 downto 0);
       eq,bt,lt: out bit);
       
end comparador;
       
  architecture funcionamento of comparador is 
  
  signal eqout,btout: bit;
  signal ab: bit_vector(7 downto 0); 
  
  begin
    
     
  ab <= A xnor B;
  
   
  eqout <= ab(0) and ab(1) and ab(2) and ab(3) and ab(4) and ab(5) and ab(6) and ab(7);
  btout <= (not B(7) and A(7)) or (ab(7) and not B(6) and A(6)) or (ab(7) and ab(6) and not B(5) and A(5)) or (ab(7) and ab(6) and ab(5) and not B(4) and A(4)) or (ab(7) and ab(6) and ab(5) and ab(4) and not B(3) and A(3)) or (ab(7) and ab(6) and ab(5) and ab(4) and ab(3) and not B(2) and A(2)) or (ab(7) and ab(6) and ab(5) and ab(4) and ab(3) and ab(2) and not B(1) and A(1)) or (ab(7) and ab(6) and ab(5) and ab(4) and ab(3) and ab(2) and ab(1) and not B(0) and A(0));
  lt <= eqout nor btout;
  
  eq <= eqout;
  bt <= btout;
  
end funcionamento; 