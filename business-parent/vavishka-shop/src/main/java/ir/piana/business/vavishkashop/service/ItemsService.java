package ir.piana.business.vavishkashop.service;

import ir.piana.business.shoppigItem.model.ItemModel;
import ir.piana.dev.springvue.core.action.Action;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;

@Service("ItemsService")
public class ItemsService extends Action {
    public Function<RequestEntity, ResponseEntity> shoppingItems = (r) -> {
        Map body = (Map) r.getBody();
        return ResponseEntity.ok(Arrays.asList(
                new ItemModel()
                        .setId(1).setCode("1").setTitle("خرم بهبهان")
                        .setImageSrc("/images/1.jpg")
                        .setPrice(10000).setDiscountPercent(40).setPriceUnit("تومان")
                        .setMeasurement(1).setMeasurementUnit("کیلورم"),
                new ItemModel()
                        .setId(2).setCode("2").setTitle("خرم بهبهان")
                        .setImageSrc("/images/2.jpg")
                        .setPrice(10000).setDiscountPercent(40).setPriceUnit("تومان")
                        .setMeasurement(1).setMeasurementUnit("کیلورم"),
                new ItemModel()
                        .setId(3).setCode("3").setTitle("خرم بهبهان")
                        .setImageSrc("/images/3.jpg")
                        .setPrice(10000).setDiscountPercent(40).setPriceUnit("تومان")
                        .setMeasurement(1).setMeasurementUnit("کیلورم")
        ));
    };
}
