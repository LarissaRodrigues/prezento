class NameScriptPresenceValidator < ActiveModel::Validator
  def validate(record)
    if record.metric.name.strip.empty?
      record.errors[:name] << I18n.t('activemodel.errors.models.metric_configuration.attributes.name.blank')
    end
    if record.metric.script.strip.empty?
      record.errors[:script] << I18n.t('activemodel.errors.models.metric_configuration.attributes.script.blank')
    end
  end
end
