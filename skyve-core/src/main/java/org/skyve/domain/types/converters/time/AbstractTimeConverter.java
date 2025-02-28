package org.skyve.domain.types.converters.time;

import org.skyve.CORE;
import org.skyve.domain.messages.ConversionException;
import org.skyve.domain.types.TimeOnly;
import org.skyve.domain.types.converters.Converter;
import org.skyve.domain.types.converters.Format;
import org.skyve.domain.types.converters.Validator;
import org.skyve.metadata.model.Attribute.AttributeType;

public abstract class AbstractTimeConverter implements Converter<TimeOnly> {
	@Override
	public final AttributeType getAttributeType() {
		return AttributeType.time;
	}

	@Override
	public Format<TimeOnly> getFormat() {
		return null;
	}

	@Override
	public Validator<TimeOnly> getValidator() {
		return null;
	}

	/**
	 * The pattern for this TimeOnly converter
	 * 
	 * @return Time format String pattern
	 */
	protected abstract String getPattern();

	protected abstract String getI18nKey();
	
	@Override
	public TimeOnly fromDisplayValue(String displayValue) throws ConversionException {
		try {
			return new TimeOnly(CORE.getDateFormat(getPattern()).parse(displayValue).getTime());
		}
		catch (Exception e) {
			throw new ConversionException(getI18nKey(), e);
		}
	}

	@Override
	public String toDisplayValue(TimeOnly value) throws ConversionException {
		try {
			return CORE.getDateFormat(getPattern()).format(value);
		}
		catch (Exception e) {
			throw new ConversionException(getI18nKey(), e);
		}
	}
}
