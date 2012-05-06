class Record
  constructor: (@id, data, @validationStrategies={}) ->
    @addProperties data
  
  addProperties: (data)->
    @setProperty key, value for own key, value of data
  
  setProperty: (property, value) ->
    throw new Error "Validation failed for #{property}: #{value}" if @validationStrategies[property]? and not @validationStrategies[property](value)
    @[property] = value
  
  setValidationStrategies: (strategies)->
    @validationStrategies = strategies

module.exports = Record
