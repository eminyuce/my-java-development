
public class MathUtil {
	
	public static double pow(double value, boolean isEject){
		if(!isEject){
			return Math.pow(value, 2);
		}
		return 0;
	}

}
