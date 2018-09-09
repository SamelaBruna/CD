  
  entity mux is 
    port(A: in bit_vector(15 downto 0);
         B: in bit_vector(15 downto 0);
         Se: in bit ; 
         Sa: out bit_vector(15 downto 0));
         
end mux;
    
    architecture funcionamento of mux is 
      begin 
        Sa(15) <= (A(15) and (not Se)) or (B(15) and Se);
        Sa(14) <= (A(14) and (not Se)) or (B(14) and Se);
        Sa(13) <= (A(13) and (not Se)) or (B(13) and Se);
        Sa(12) <= (A(12) and (not Se)) or (B(12) and Se);
        Sa(11) <= (A(11) and (not Se)) or (B(11) and Se);
        Sa(10) <= (A(10) and (not Se)) or (B(10) and Se);
        Sa(9)  <= (A(9) and (not Se)) or (B(9) and Se);
        Sa(8)  <= (A(8) and (not Se)) or (B(8) and Se);
        Sa(7)  <= (A(7) and (not Se)) or (B(7) and Se);
        Sa(6)  <= (A(6) and (not Se)) or (B(6) and Se);
        Sa(5)  <= (A(5) and (not Se)) or (B(5) and Se);
        Sa(4)  <= (A(4) and (not Se)) or (B(4) and Se);
        Sa(3)  <= (A(3) and (not Se)) or (B(3) and Se);
        Sa(2)  <= (A(2) and (not Se)) or (B(2) and Se);
        Sa(1)  <= (A(1) and (not Se)) or (B(1) and Se);   
        Sa(0)  <= (A(0) and (not Se)) or (B(0) and Se);
        
end funcionamento;



