package org.skyve.domain.types.converters.timestamp;

import org.skyve.domain.messages.ConversionException;

public class DD_MMM_YYYY_HH24_MI_SS extends AbstractTimestampConverter {
	private static final String PATTERN = "dd-MMM-yyyy HH:mm:ss";

	@Override
	protected String getPattern() {
		return PATTERN;
	}
	
	@Override
	protected String getI18nKey() {
		return ConversionException.DD_MMM_YYYY_HH24_MI_SS_KEY;
	}
}
