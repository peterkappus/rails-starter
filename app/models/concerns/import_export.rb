module ImportExport
  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv
      require 'csv'
      attributes = self::HEADERS

      CSV.generate(headers: true) do |csv|
        csv << attributes #headers

        all.each do |line|
          csv << attributes.map{ |attr| line.send(attr) }
        end
      end
    end

    #TODO: DRY THIS UP...
    def import(file)
      #should've already checked the file in the controller, but double-check headers are valid

      missing_cols = self::HEADERS - CSV.read(file.path,headers: true).headers
      return "Missing columns: #{missing_cols.join(", ")}" unless missing_cols.empty?

      CSV.foreach(file.path, headers: true) do |row|

        #update an exisitng one?
        t = self.find_by(id: row['id'])

        if(t.present?) #use find_by so we don't get an error if it's not found
          #find things that we need to link to
          #parent = self.find(row['parent_id']) unless row['parent_id'].to_s.empty?
          #user = Person.find_by(user_id: row['user_id']) if row['user_id'].present?
          #status = Status.find_by(status_id: row['status_id']) if row['status_id'].present?

          value_hash = {}
          self::HEADERS.map{ |h| value_hash[h] = row[h] }

          #discard any attributes we included in the export which don't actually exist in the model
          # e.g. user_name (which we include for readability) when you only really need the user_id...
          value_hash.select!{|x| self.attribute_names.index(x.to_s)}

          #update with values from row
          t.update!(value_hash)

          #t.update!(parent: parent) if parent.present?
          #t.update!(parent: parent) if parent.present?
          #t.update!(user: user) if user.present?
          #t.update!(status: status) if status.present?
        else
          #or create a new one.
          #assumes parents are always created before children... is this true?
          value_hash = {}
          self::HEADERS.map{|h| value_hash[h] = row[h]}

          #discard anything that isn't a valid attribute
          value_hash.select!{|x| self.attribute_names.index(x.to_s)}

          #create with values from row
          t = self.create!(value_hash)

          parent = self.find_by(imported_id: row['parent_id'].to_s) unless row['parent_id'].to_s.empty?
          user = User.find_by(imported_id: row['user_id']) if row['user_id'].present?
          #status = Status.find_by(imported_id: row['status_id']) if row['status_id'].present?

          #link them
          t.update!(parent: parent) if parent.present?
          t.update!(user: user) if user.present?
        end
      end

    end

  end
end
