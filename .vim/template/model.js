/**
 * My Model
 * File:    @{@expand('%:t')@}@
 * Auther:  sunvisor
 * Date:    @{@strftime('%Y-%m-%d')@}@
 * Copyright (C) Sunvisor @{@strftime('%Y')@}@ All right reserved.
 */
Ext.define('MyApp.model.User', {
    extend: 'Ext.data.Model',
    fields: ['id', 'name', 'email']
});
