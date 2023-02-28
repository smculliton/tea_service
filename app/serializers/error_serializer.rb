class ErrorSerializer
  def self.record_not_created
    {
      errors: 
      {
        status: 400,
        title: 'RECORD CREATION FAILED',
        detail: 'Unable to create new record with given params'
      }
    }
  end

  def self.record_not_found(id)
    {
      errors: 
      {
        status: 400,
        title: 'NONEXISTENT RECORD',
        detail: "Unable to find record with given id '#{id}'"
      }
    }
  end
end