package com.alcatel.lucent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GelismisHesaplamaImpl implements GelismisHesaplama {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(GelismisHesaplamaImpl.class);

	@Override
	public double karakok(double x) {
		double result = Math.sqrt(x);
		LOGGER.info("Result :" + result);
		return result;
	}

}
