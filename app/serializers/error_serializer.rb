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
end