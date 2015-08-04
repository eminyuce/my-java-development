
public class PowerMain {
	
	public static void main(String[] args) {
		
		CurrentComponent currentComponent = new CurrentComponent();
		
		currentComponent.setVoltage(100);
		currentComponent.setCurrent1(2);
		currentComponent.setCurrent2(3);
		currentComponent.setCurrent3(4);
		currentComponent.setCurrent4(5);
		currentComponent.setCurrent5(1);
		currentComponent.setCurrent6(2);
		currentComponent.setCurrent7(3);
		
		
		
		PowerAnalyzerService analyzerService = new  PowerAnalyzerService();
		double  result =  analyzerService.calculateCurrentTotal(currentComponent);
		System.out.println("Current Total="+result);
		
		result =  analyzerService.calculateApparentPower(currentComponent);
		System.out.println("Apparent Power="+result);

        result =  analyzerService.activePower(currentComponent);
        System.out.println("Active Power="+result);



        result =  analyzerService.reactivePower(currentComponent);
        System.out.println("Reactive Power="+result);


        result =  analyzerService.distortionPower(currentComponent);
        System.out.println("Distortion Power="+result);


        result =  analyzerService.calculateDisplacementPowerFactor(currentComponent);
        System.out.println("Displacement Power Factor="+result);



        result =  analyzerService.calculatePowerFactor(currentComponent);
        System.out.println("Power Factor="+result);


        result =  analyzerService.calculateTotalHarmonicDistortion(currentComponent);
        System.out.println("Total Harmonic Distortion="+result);



    }

}
