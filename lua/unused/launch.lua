LAZY_PLUGIN_SPEC = {}

function spec(item)
    table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

function spec_content(item)
    table.insert(LAZY_PLUGIN_SPEC, item)
end
