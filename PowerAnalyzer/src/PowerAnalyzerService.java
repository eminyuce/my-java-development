public class PowerAnalyzerService  {

	
	// Ia: Fundamental Component Current
	public double calculateCurrentTotal(CurrentComponent currentComponent){
		double result = 0;
		
		double currentPow = MathUtil.pow(currentComponent.getCurrent1(),currentComponent.isCurrent1Eject())+
				MathUtil.pow(currentComponent.getCurrent2(),currentComponent.isCurrent2Eject())+
		 MathUtil.pow(currentComponent.getCurrent3(),currentComponent.isCurrent3Eject())+
		 MathUtil.pow(currentComponent.getCurrent4(),currentComponent.isCurrent4Eject())+
		 MathUtil.pow(currentComponent.getCurrent5(),currentComponent.isCurrent5Eject())+
		 MathUtil.pow(currentComponent.getCurrent6(),currentComponent.isCurrent6Eject())+
		 MathUtil.pow(currentComponent.getCurrent7(),currentComponent.isCurrent7Eject());
		double currentSqrt = Math.sqrt(currentPow);
		result =currentSqrt;
		return result;
	}
	// Sa: Apparent Power
	public double calculateApparentPower(CurrentComponent currentComponent){
		double sa=0;
		double ia=calculateCurrentTotal(currentComponent);
		sa=ia*currentComponent.getVoltage()/Math.sqrt(3);
		return sa;
	}
	
	public double activePower(CurrentComponent currentComponent){
        double r=Math.PI / 180;
        double pa = currentComponent.getVoltage()
                * currentComponent.getCurrent1()
                *  Math.cos(currentComponent.getPhase1()*r) / Math.sqrt(3);
        return pa;

    }

    public double reactivePower(CurrentComponent currentComponent){
        double r=Math.PI / 180;
        double qa = currentComponent.getVoltage()
                * currentComponent.getCurrent1()
                *  Math.sin(currentComponent.getPhase1()*r) / Math.sqrt(3);
        return qa * (-1);

    }

    public double distortionPower(CurrentComponent currentComponent){
        double sa = calculateApparentPower(currentComponent);
        double qa = reactivePower(currentComponent);
        double pa = activePower(currentComponent);
        double da=Math.sqrt(Math.pow(sa,2)-Math.pow(qa,2)-Math.pow(pa,2));
        return da;
    }
	public double calculateDisplacementPowerFactor(CurrentComponent currentComponent){
        double r = Math.PI / 180;
        return  Math.cos(currentComponent.getPhase1() * r);
    }

    public double calculatePowerFactor(CurrentComponent currentComponent){
        double dpf=calculateDisplacementPowerFactor(currentComponent);
        double ia = calculateCurrentTotal(currentComponent);
        double d = dpf * currentComponent.getCurrent1() / ia;

        return d;
    }
	public double calculateTotalHarmonicDistortion(CurrentComponent currentComponent){
        double p = Math.pow(currentComponent.getCurrent2(),2)+
                Math.pow(currentComponent.getCurrent3(),2)+
                Math.pow(currentComponent.getCurrent4(),2)+
                Math.pow(currentComponent.getCurrent5(),2)+
                Math.pow(currentComponent.getCurrent6(),2)+
                Math.pow(currentComponent.getCurrent7(),2);
        p = Math.sqrt(p)/ currentComponent.getCurrent1()*100;

        return p;


    }
	

}
