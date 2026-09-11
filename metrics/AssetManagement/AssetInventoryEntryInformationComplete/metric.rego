package cch.metrics.asset_inventory_entry_information_complete

import data.cch.compare
import rego.v1

import input.assetInventory as ai

default applicable := false

default compliant := false

applicable if {
    ai
    is_object(ai)
    "allRequiredInformationRecorded" in object.keys(ai)
}

compliant if {
    compare(data.operator, data.target_value, ai.allRequiredInformationRecorded)
}
