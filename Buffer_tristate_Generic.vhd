library ieee;    
use ieee.std_logic_1164.all;    
  
entity Buffer_tristate_Generic is
generic (n: integer:=5);
port (Entrada: in std_logic_vector(n-1 downto 0);
      En: in std_logic;
      Salida: out std_logic_vector(n-1 downto 0));
end Buffer_tristate_Generic;
    
architecture Solucion of Buffer_tristate_Generic is
begin
   Salida<=(others=>'Z') when En='0' else Entrada;
end Solucion;
