package com.dimas.moexdataservice.model.kafka.currency;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class MoexCurrencyData {
    @JsonProperty("securities")
    List<Security> securities;
    @JsonProperty("current")
    Current current;
}
