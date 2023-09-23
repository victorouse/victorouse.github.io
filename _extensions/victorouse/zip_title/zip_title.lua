return {
  ['zip_title'] = function(args, kwargs, meta)
    local title = pandoc.utils.stringify(meta['title'])

    if title == nil then
      return pandoc.Null()
    end

    -- Lowercase the title
    title = title:lower()

    -- Replace spaces with underscores
    title = title:gsub("%s", "_")

    -- Strip any non-alphanumeric characters except underscores
    title = title:gsub("%W", function(c)
      if c == "_" then return c end
      return ""
    end)

    return title .. ".txt"
  end
}
