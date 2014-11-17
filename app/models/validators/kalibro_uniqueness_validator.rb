class KalibroUniquenessValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.class.all.each do |entity|
      if (entity.send(attribute) == value) and (entity.id != record.id)
        record.errors[attribute] << I18n.t('kalibro_error_message', record: record.class, attribute: attribute, value: value)
        break
      end
    end
  end
end
