package com.alcatel.lucent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class HesaplamaImpl implements Hesaplama {

	@Autowired
	private GelismisHesaplamaImpl gelismisHesaplamaImpl;
	
    private static final Logger LOGGER = LoggerFactory.getLogger(HesaplamaImpl.class);

	@Override
	public double topla(double x, double y) {
		double result = x+y;
		LOGGER.info("Result :"+result);
		return result;
	}

	@Override
	public double cikarma(double x, double y) {
		double result = x-y;
		LOGGER.info("Result :"+result);
		return result;
	}
	
	
	public double useKarakok(double x){
		double result = gelismisHesaplamaImpl.karakok(x);
		//TODO calculate ....
		
		//Business layer.
		result = result - 1000;
		
		return result;
	}

	public void setGelismisHesaplamaImpl(GelismisHesaplamaImpl gelismisHesaplamaImpl) {
		this.gelismisHesaplamaImpl = gelismisHesaplamaImpl;
	}

}
