def throw_error(http_error_code: 500, error_message: 'No error provided.')
  halt 403, JSON.puts({
    :error => error_message
  })
end
