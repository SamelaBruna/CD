entity muxSelect3 is 
  port(Am,Bm: in bit_vector(3 downto 0);
       Se0,Se1,Se2: in bit;
       Sabt,Salt: out bit_vector(3 downto 0)
       );
       --Se0 = eq
       --Se1 = bt
       --Se2 = lt
end muxSelect3;

architecture funcionamento of muxSelect3 is
  begin
    Sabt(0)<= (Se0 and not Se1 and not Se2 and Am(0))or (not Se0 and Se1 and not Se2 and Am(0)) or (not Se0 and not Se1 and Se2 and Bm(0));
    Sabt(1)<= (Se0 and not Se1 and not Se2 and Am(1))or (not Se0 and Se1 and not Se2 and Am(1)) or (not Se0 and not Se1 and Se2 and Bm(1));
    Sabt(2)<= (Se0 and not Se1 and not Se2 and Am(2))or (not Se0 and Se1 and not Se2 and Am(2)) or (not Se0 and not Se1 and Se2 and Bm(2));
    Sabt(3)<= (Se0 and not Se1 and not Se2 and Am(3))or (not Se0 and Se1 and not Se2 and Am(3)) or (not Se0 and not Se1 and Se2 and Bm(3));

    Salt(0)<= (Se0 and not Se1 and not Se2 and Am(0))or (not Se0 and Se1 and not Se2 and Bm(0)) or (not Se0 and not Se1 and Se2 and Am(0));
    Salt(1)<= (Se0 and not Se1 and not Se2 and Am(1))or (not Se0 and Se1 and not Se2 and Bm(1)) or (not Se0 and not Se1 and Se2 and Am(1));
    Salt(2)<= (Se0 and not Se1 and not Se2 and Am(2))or (not Se0 and Se1 and not Se2 and Bm(2)) or (not Se0 and not Se1 and Se2 and Am(2));
    Salt(3)<= (Se0 and not Se1 and not Se2 and Am(3))or (not Se0 and Se1 and not Se2 and Bm(3)) or (not Se0 and not Se1 and Se2 and Am(3));
  

end funcionamento; 
  
     
