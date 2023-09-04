library ieee;
use ieee.std_logic_1164.all;
entity MSS is
	port(Clock, Resetn, Start, Consulta, Comenzar_Compra, Ingreso_moneda, Moneda_invalida, Ingresar, 
	     Valor_superado, Regresar, Limite, Despachar, Medida, Limite_topping: in std_logic;
		  En_topping, Ld_topping, Sel_reloj, Mostrar_Precio, Mostrar_Toppings, 
		  Mostrar_Tipo, S1, S0, En_cnt, Ld_Cnt, Moneda_rechazada, En_valor, Saldo_insuficiente, 
		  En_tipo,En_toppings, RorW,Mostrar_Topping, Helado_listo, Compuerta, En_moneda, Reset_Precio, Reset_reloj: out std_logic);
end MSS;

architecture Controlador of MSS is 
type estado is (Ta, Tb, Tc, Td, Te, Tf, Tg, Th, Ti, Tj, Tk, Tl, Tmm, Tm, Tn, Too, Tp,Tq, Tr, Ts, Ttt, Tt, Tu, Tv, Tw, Tx, Ty, Tz,
					 Taa, Tab, Tac, Tad, Tae, Taf, Tag, Tah, Tai);
signal y: estado;
begin
	process(Clock, Resetn)
	begin
		if Resetn='0' then y<=Ta;
		elsif (Clock' event and Clock='1') then
			case y is
				when Ta=> if Start='1' then y<=Tb; else y<=Ta; end if;
				when Tb=> if Start='0' then y<=Tc; else y<=Tb; end if;
				when Tc=> if Consulta='1' then y<=Td; else y<=Th; end if;
				when Td=> if Consulta='0' then y<=Te; else y<=Td; end if;
				when Te=> y<=Tf;
				when Tf=> if Limite='1' then y<=Tg; else y<=Tf; end if;
				when Tg=> y<=Tc;
				when Th=> if Comenzar_Compra='1' then y<=Tmm;
							 elsif Ingreso_moneda='1' then y<=Ti;
							 else  y<=Tc; 
							 end if;
				when Ti=> if Moneda_invalida='1' then y<=Tl; else y<=Tj; end if;
				when Tj=> y<=Tk;
				when Tk=> if Ingreso_moneda='0' then y<=Tc; else y<=Tk; end if;
				when Tl=> if Ingreso_moneda='0' then y<=Tc; else y<=Tl; end if;
				when Tmm=> if Comenzar_Compra='0' then y<=Tm; else y<=Tmm; end if;
				when Tm=> if Ingresar='1' then y<=Tn; else y<=Tm; end if;
				when Tn=> if Ingresar='0' then y<=Too; else y<=Tn; end if;
				when Too=> if Medida='1' then y<=Tq; else y<=Tp; end if;
				when Tp=> y<=Ttt;
				when Tq=> y<=Ttt;
				when Tr=> if Regresar='1' then y<=Ts; else y<=Tr; end if;
				when Ts=> if Regresar='0' then y<=Tc; else y<=Ts; end if;
				when Ttt => if Valor_superado='1' then y<=Tt; else y<=Tr; end if;
				when Tt=> if Ingresar='1' then y<=Tu; else y<=Tt; end if;
				when Tu=> if Ingresar='0' then y<=Tv; else y<=Tu; end if;
				when Tv=> y<=Tw;
				when Tw=> if Ingresar='1' then y<=Tx; else y<=Tw; end if;
				when Tx=> if Ingresar='0' then y<=Ty; else y<=Tx; end if;
				when Ty=> y<=Tz;
				when Tz=> if Limite='1' then y<=Taa; else y<=Tab; end if;
				when Taa=> y<=Tz;
				when Tab=> y<=Tac;
				when Tac=> y<=Tad;
				when Tad=> if Despachar='1' then y<=Tae; else y<=Tad; end if;
				when Tae=> if Despachar='0' then y<=Taf; else y<=Tae; end if;
				when Taf=> y<=Tag;
				when Tag=> if Limite_topping='1' then y<=Tah; else y<=Tag; end if;
				when Tah=> if Regresar='1' then y<=Tai; else y<=Tah; end if; 
				when Tai=> if Regresar='0' then y<=Tc; else y<=Tai; end if;
			end case;
		end if;
	end process;
	
	process(y)
	begin
		En_cnt<='0'; Ld_Cnt<='0'; Sel_reloj<='0'; En_topping<='0'; Ld_topping<='0'; Mostrar_Precio<='0'; 
		Mostrar_Toppings<='0'; Mostrar_Topping<='0'; Mostrar_Tipo<='0'; S1<='0'; S0<='0'; Moneda_rechazada<='0'; En_valor<='0'; 
		Saldo_insuficiente<='0'; En_tipo<='0'; En_toppings<='0'; RorW<='0'; Helado_listo<='0'; Compuerta<='0'; En_moneda<='0'; Reset_Precio<='0'; Reset_reloj<='0';
		case y is
			when Ta=> 
			when Tb=>
			when Tc=> En_topping<='1'; Ld_topping<='1'; Mostrar_Precio<='1'; 
			when Td=> 
			when Te=> En_cnt<='1'; Ld_Cnt<='1'; Reset_reloj<='1';
			when Tf=> En_cnt<='1'; Mostrar_Precio<='1'; Mostrar_Toppings<='1'; Mostrar_Tipo<='1'; S1<='1';Sel_reloj<='1';
			when Tg=> En_cnt<='1'; Ld_Cnt<='1';
			when Th=> Mostrar_Precio<='1'; 
			when Ti=> Mostrar_Precio<='1';  
			when Tj=> Mostrar_Precio<='1'; En_moneda <='1'; 
			when Tk=> Mostrar_Precio<='1'; 
			when Tl=> Mostrar_Precio<='1'; Moneda_rechazada<='1';
			when Tmm=> Mostrar_Precio<='1';
			when Tm=> Mostrar_Precio<='1';
			when Tn=> Mostrar_Precio<='1';
			when Too=> Mostrar_Precio<='1';
			when Tp=> Mostrar_Precio<='1'; En_valor<='1';
			when Tq=> Mostrar_Precio<='1'; S0<='1'; En_valor<='1';
			when Tr=> Mostrar_Precio<='1'; Saldo_insuficiente<='1'; 
			when Ts=> Mostrar_Precio<='1'; 
			when Ttt => Mostrar_Precio<='1'; 
			when Tt=> Mostrar_Precio<='1'; 
			when Tu=> Mostrar_Precio<='1'; 
			when Tv=> Mostrar_Precio<='1'; En_tipo<='1'; 
			when Tw=> Mostrar_Precio<='1'; Mostrar_Tipo<='1';
			when Tx=> Mostrar_Precio<='1'; Mostrar_Tipo<='1';
			when Ty=> Mostrar_Precio<='1'; Mostrar_Tipo<='1'; En_toppings<='1';
			when Tz=> Mostrar_Precio<='1'; Mostrar_Tipo<='1'; Mostrar_Toppings<='1';
			when Taa=> Mostrar_Precio<='1'; Mostrar_Tipo<='1'; Mostrar_Toppings<='1'; En_cnt<='1'; Ld_Cnt<='1'; 
			when Tab=> Mostrar_Precio<='1'; Mostrar_Tipo<='1'; Mostrar_Toppings<='1'; RorW<='1';
			when Tac=> Mostrar_Precio<='1'; Mostrar_Tipo<='1'; Mostrar_Toppings<='1'; En_cnt<='1';
			when Tad=> Mostrar_Precio<='1'; Mostrar_Tipo<='1'; Mostrar_Toppings<='1'; 
			when Tae=> Mostrar_Precio<='1'; Mostrar_Tipo<='1'; Mostrar_Toppings<='1'; 
			when Taf=> Reset_reloj<='1';
			when Tag=> Sel_reloj<='1'; Mostrar_Topping<='1'; En_topping<='1';
			when Tah=> Helado_listo<='1'; Compuerta<='1'; 
			when Tai=> Reset_Precio<='1';
		end case;
	end process;
end Controlador;
