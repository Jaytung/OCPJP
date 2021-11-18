package uuu.AC10.test;

import uuu.AC10.entity.Airplane;
import uuu.AC10.entity.F16;
import uuu.AC10.entity.Flyer;
import uuu.AC10.entity.RiverBarge;
import uuu.AC10.entity.Truck;
import uuu.AC10.entity.Vehicle;

public class TestTruck{

	public static void main(String[] args) {
		Vehicle t1 = new Truck(5.5);
		Vehicle r1 = new RiverBarge(10.0);
		Vehicle a1 = new Airplane(20);
		Vehicle f1 = new F16(15.0);
		t1.setLoad(5.5);
		r1.setLoad(9);
		a1.setLoad(18);
		System.out.println("T1 MAX_LOAD: "+t1.getMAX_LOAD());
		System.out.println("T1 Load: "+t1.getLoad());
		System.out.println("R1 MAX_LOAD: "+r1.getMAX_LOAD());
		System.out.println("R1 Load: "+r1.getLoad());
		System.out.println("A1 MAX_LOAD: "+a1.getMAX_LOAD());
		System.out.println("A1 Load: "+a1.getLoad());
		if(a1 instanceof Flyer) {
			((Flyer)a1).takeOff();
			((Flyer)a1).fly();
			((Flyer)a1).land();
		}
		if(f1 instanceof Flyer) {
			((F16)f1).takeOff();
			((F16)f1).fly();
			((F16)f1).fight();
			((F16)f1).land();
		}
		
		System.out.println(
				t1.calculateCostByMonth(2021, 10)+
				r1.calculateCostByMonth(2021, 10)+
				a1.calculateCostByMonth(2021, 10));
	}


}
