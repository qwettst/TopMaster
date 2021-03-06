package net.rory.springserverapp.dao;

import net.rory.springserverapp.model.Spec;
import net.rory.springserverapp.model.SpecUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SpecUserDao extends JpaRepository<SpecUser, Long> {
}
